<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" />
            <br />
        </c:forEach>
    </div>
</c:if>

<script type="text/javascript">
    $(function() {
        $('#star').barrating({
            theme : 'fontawesome-stars'
        });

        var words = ("34.392777,132.457525").split(',');

        if (document.getElementById("map_info").value != "") {
             words = (document
                     .getElementById('map_info').value)
                     .split(',')

        }
        var latlng = new google.maps.LatLng(
                words[0], words[1]);
        var opts = {
            zoom : 14,
            center : latlng,
            mapTypeId : google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document
                .getElementById("map"), opts);
        if (document.getElementById("map_info").value != "") {
            var m_latlng1 = new google.maps.LatLng(
                    words[0], words[1]);
            var marker1 = new google.maps.Marker({
                position : m_latlng1,
                map : map
            });
        }

      //クリックイベントを追加
        map.addListener('click', function(e) {
            //alert();
            getClickLatLng(e.latLng, map);

        });
        //alert(map);

        function getClickLatLng(lat_lng, map) {
            // 座標を表示
            //document.getElementById('lat').textContent = lat_lng.lat();
            //document.getElementById('lng').textContent = lat_lng.lng();
            document.getElementById('map_info').value = lat_lng.lat() + ","
                    + lat_lng.lng();
            //alert(document.getElementById('map_info').value);
            // マーカーを設置
            var marker = new google.maps.Marker({
                position : lat_lng,
                map : map
            });

            // 座標の中心をずらす
            // http://syncer.jp/google-maps-javascript-api-matome/map/method/panTo/
            map.panTo(lat_lng);
        }
    });



</script>

<label for="star">激辛度</label>
<br />

<select name="star" id="star">
    <option value="1" <c:if test="${report.star == 1}"> selected</c:if>>1</option>
    <option value="2" <c:if test="${report.star == 2}"> selected</c:if>>2</option>
    <option value="3" <c:if test="${report.star == 3}"> selected</c:if>>3</option>
    <option value="4" <c:if test="${report.star == 4}"> selected</c:if>>4</option>
    <option value="5" <c:if test="${report.star == 5}"> selected</c:if>>5</option>

</select>

<label for="report_date">日付</label>
<br />
<input type="date" name="report_date"
    value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br />
<br />

<label for="name">名前</label>
<br />
<c:out value="${sessionScope.login_contributor.name}" />
<br />
<br />


<label for="store">店名</label>
<br />
<input type="text" name="store" value="${report.store}" />
<br />
<br />

<label for="title">口コミ</label>
<br />
<input type="text" name="title" value="${report.title}" />
<br />
<br />

<div id="map"></div>
<input type="hidden" name="map_info" id="map_info" value="${map_info}" />


<label for="content">口コミ内容</label>
<br />
<textarea name="content" rows="10" cols="50">${report.content}</textarea>
<br />
<br />


<input type="hidden" name="_token" value="${_token}" />
<input type="hidden" name="_delete_flg" value="${_delete_flg}" />
<c:if test="${_delete_flg == null}">
<button type="submit">投稿</button>
</c:if>
<c:if test="${_delete_flg != null}">
    <button type="submit">削除</button>
</c:if>