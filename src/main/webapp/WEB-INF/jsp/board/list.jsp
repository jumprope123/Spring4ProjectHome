<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:parseNumber var="cp" value="${param.cp}"/>
<fmt:parseNumber var="pp" value="10"/>
<fmt:parseNumber var="bdcnt" value="${bdcnt}"/>

<fmt:parseNumber var="sp" value="${(cp-1) / pp}" integerOnly="true"/>
<fmt:parseNumber var="sp" value="${(sp * 10) + 1}"/>
<fmt:parseNumber var="ep" value="${sp + 9}"/>
<fmt:parseNumber var="tp" value="${bdcnt/pp}" integerOnly="true"/>
<c:if test="${bdcnt%pp ne 0}">
    <fmt:parseNumber var="tp" value="${tp + 1}"/>
</c:if>





<div id="main">
    <div class="margin30">
        <h3><i class="bi bi-chat-dots-fill bidragup"></i>&nbsp;게시판</h3>
        <hr>
    </div>

    <div class="row margin1050">
        <div class="col-12 text-right">
            <c:if test="${not empty UID}"> <!--로그인되어있는 상태에서만 보임-->
            <button type="button" id="newbd" class="btn btn-info"><i class="bi bi-plus-circle bidragup"></i>&nbsp;새글쓰기</button>
            </c:if>
        </div>
    </div>
    <div class="row margin1050">
        <div class="col-12">
            <table class="table table-striped tblines text-center table-hover">
                <thead style="background: #dff0d8">
                <tr>
                    <th style="width: 7%">번호</th>
                    <th>제목</th>
                    <th style="width: 12%">작성자</th>
                    <th style="width: 10%">작성일</th>
                    <th style="width: 7%">추천</th>
                    <th style="width: 7%">조회</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-danger">
                    <th>공지</th>
                    <th><span class="badge badge-danger">Hot</span> 삼성을 사시오! 십성가즈아!!! 삼멘! 이재용짱짱맨!</th>
                    <th>Mr.shin</th>
                    <th>2021.01.15</th>
                    <th>999</th>
                    <th>999</th>
                </tr>
                <c:forEach var="b" items="${bds}">
                    <tr>
                        <td>${b.bno}</td><td><a href="/board/view?bno=${b.bno}&cp=${param.cp}" class="colblack">${b.title}</a></td><td>${b.userid}</td><td>${fn:substring(b.regdate,0,10)}</td><td>${b.thumbs}</td><td>${b.views}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <ul class="pagination justify-content-center">

                <c:if test="${sp eq 1}">
                    <li class="page-item disabled"><a href="/board/list?cp=${sp - 10}" class="page-link">이전</a></li>
                </c:if>
                <c:if test="${sp ne 1}">
                    <li class="page-item"><a href="/board/list?cp=${sp - 10}" class="page-link">이전</a></li>
                </c:if>

                <c:forEach var="i" begin="${sp}" end="${ep}" step="1">
                        <c:if test="${i le tp}">
                            <c:if test="${i eq param.cp}">
                                <li class="page-item active"><a href="/board/list?cp=${i}" class="page-link">${i}</a></li>
                            </c:if>
                            <c:if test="${i ne param.cp}">
                                <li class="page-item"><a href="/board/list?cp=${i}" class="page-link">${i}</a></li>
                            </c:if>
                        </c:if>
                </c:forEach>

                <c:if test="${ep le tp}">
                    <li class="page-item"><a href="/board/list?cp=${sp + 10}" class="page-link">다음</a></li>
                </c:if>
                <c:if test="${ep gt tp}">
                    <li class="page-item disabled"><a href="/board/list?cp=${sp + 10}" class="page-link">다음</a></li>
                </c:if>
            </ul>
        </div>
    </div><!--페이지네이션-->

</div>