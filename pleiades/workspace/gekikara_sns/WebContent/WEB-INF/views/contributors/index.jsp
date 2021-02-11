<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>投稿者　一覧</h2>
        <table id="contributor_list">
            <tbody>
                <tr>
                    <th>投稿者ID</th>
                    <th>氏名</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="contributor" items="${contributors}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${contributor.code}" /></td>
                        <td><c:out value="${contributor.name}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${contributor.delete_flag == 1}">
                                    （削除済み）
                                </c:when>
                                <c:otherwise>
                                    <a href="<c:url value='/contributors/show?id=${contributor.id}' />">詳細を表示</a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${contributors_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((contributors_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/contributors/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/contributors/new' />">新規登録</a></p>

 </c:param>
</c:import>
