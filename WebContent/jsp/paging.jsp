<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="paginate">
 
    <c:if test="${paging.currentPageNo ne paging.firstPageNo}">
        <a href="showNoticeListForm.do?currentPageNo=${paging.prevPageNo}&recordsPerPage=${paging.recordsPerPage}" class="prev">이전</a>
    </c:if>
    <span>
        <c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq paging.currentPageNo}">
                    <b><font size=+1>
                            <a href="showNoticeListForm.do?currentPageNo=${i}&recordsPerPage=${paging.recordsPerPage}" class="choice">${i}</a>
                        </font>
                    </b>
                </c:when>
                <c:otherwise>
                    <a href="showNoticeListForm.do?currentPageNo=${i}&recordsPerPage=${paging.recordsPerPage}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    
    <c:if test="${paging.currentPageNo ne paging.finalPageNo}">
        <a href="showNoticeListForm.do?currentPageNo=${paging.nextPageNo}&recordsPerPage=${paging.recordsPerPage}" class="next">다음</a>
    </c:if>
</div>