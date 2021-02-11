<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="/WEB-INF/views/layout/app2.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2>口コミ 詳細ページ</h2>
                <script type="text/javascript">
                    $(function() {
                        $('#star').barrating({
                            theme : 'fontawesome-stars'
                        });
                        $('#star').barrating('readonly', true);
                    });
                </script>
                <table>
                    <tbody>
                        <tr>
                            <th>名前</th>
                            <td><c:out value="${report.contributor.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${report.report_date}"
                                    pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>激辛度</th>
                            <td><select name="star" id="star">
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
                            </select></td>
                        </tr>
                        <tr>
                            <th>店名</th>
                            <td><pre>
                                <c:out value="${report.store}" />
                            </pre></td>
                        </tr>
                        <tr>
                            <th>口コミ</th>
                            <td><pre>
                                    <c:out value="${report.title}" />
                                </pre></td>
                        </tr>
                        <tr>
                            <th>口コミ内容</th>
                            <td><pre>
                                    <c:out value="${report.content}" />
                                </pre></td>
                        </tr>

                        <tr>
                            <th>登録日時</th>
                            <td><fmt:formatDate value="${report.created_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td><fmt:formatDate value="${report.updated_at}"
                                    pattern="yyyy-MM-dd HH:mm:ss" /></td>
                        </tr>
                        <tr>
                            <th>場所</th>
                            <td><input type="hidden" name="map_info" id="map_info"
                                value="${map_info}" />
                                <div id="map"></div>
                                <script type="text/javascript">
                                    // 座標を設定
                                    var words = (document
                                            .getElementById('map_info').value)
                                            .split(',')
                                    var latlng = new google.maps.LatLng(
                                            words[0], words[1]);
                                    var opts = {
                                        zoom : 14,
                                        center : latlng,
                                        mapTypeId : google.maps.MapTypeId.ROADMAP
                                    };
                                    var map = new google.maps.Map(document
                                            .getElementById("map"), opts);

                                    var m_latlng1 = new google.maps.LatLng(
                                            words[0], words[1]);
                                    var marker1 = new google.maps.Marker({
                                        position : m_latlng1,
                                        map : map
                                    });
                                </script></td>
                        </tr>
                    </tbody>
                </table>



                <c:if
                    test="${sessionScope.login_contributor.id == report.contributor.id}">
                    <p>
                        <a href="<c:url value="/reports/edit?id=${report.id}" />">この口コミを編集する</a>
                    </p>
                    <p>
                        <a href="<c:url value="/reports/editdelete?id=${report.id}" />">この口コミを削除する</a>
                    </p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p>
            <a href="<c:url value="/reports/index" />">一覧に戻る</a>
        </p>
    </c:param>
</c:import>