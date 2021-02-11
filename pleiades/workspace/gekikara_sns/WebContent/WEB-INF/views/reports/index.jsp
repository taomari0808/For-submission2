<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/views/layout/app2.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>投稿内容 一覧</h2>
        <table id="report_list">
            <tbody>
                <tr>
                    <th class="report_name">名前</th>
                    <th class="report_date">日付</th>
                    <th class="report_store">店名</th>
                    <th class="report_title">口コミ</th>
                    <th class="report_star">激辛度</th>
                    <th class="report_action">もっと詳しく見る</th>
                </tr>
                <c:forEach var="report" items="${reports}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="report_name"><c:out
                                value="${report.contributor.name}" /></td>
                        <td class="report_date"><fmt:formatDate
                                value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="report_store">${report.store}</td>
                        <td class="report_title">${report.title}</td>
                        <td class="report_star">
                        <select name="star${status.count}"
                            id="star${status.count}">
                                <option value="1"
                                    <c:if test="${report.star == 1}"> selected</c:if>>1</option>
                                <option value="2"
                                    <c:if test="${report.star == 2}"> selected</c:if>>2</option>
                                <option value="3"
                                    <c:if test="${report.star == 3}"> selected</c:if>>3</option>
                                <option value="4"
                                    <c:if test="${report.star == 4}"> selected</c:if>>4</option>
                                <option value="5"
                                    <c:if test="${report.star == 5}"> selected</c:if>>5</option>
                        </select>

                        </td>
                        <td class="report_action"><a
                            href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${reports_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}"
                step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/reports/index?page=${i}' />"><c:out
                                value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>

<script type="text/javascript">
            for (let step = 1; step < ${reports_count}+1; step++) {
                 $('#star'+ step).barrating({
                     theme : 'fontawesome-stars'
                 });
                 $('#star'+ step).barrating('readonly',
                         true);
}
            </script>
        </div>
        <p>
            <a href="<c:url value='/reports/new' />">新規日報の登録</a>
        </p>

    </c:param>
</c:import>

