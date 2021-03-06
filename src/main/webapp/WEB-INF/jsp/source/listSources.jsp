<%@ include file="/WEB-INF/jsp/common/tags-head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta-head.jsp"%>
<link rel="stylesheet" type="text/css" href="/static/css/bootstrap-table.min.css">
<script src="/static/js/bootstrap-table.min.js"></script>
</head>
<body>

	<spring:message code="search.complete" var="searchComplete" />
<spring:message code="search.title" var="searchTitle" />
<spring:message code="search.source" var="searchSource" />
<spring:message code="search.authorial" var="searchAuthorial" />

    <%@ include file="/WEB-INF/jsp/common/fixed-top-ldod-header.jsp"%>

    <div class="container">
        <h3 class="text-center">
       	    <span class="tip" title="<spring:message code="sourcelist.tt.sources" />">
            <spring:message code="authorial.source" />
            (${sources.size()})
            </span>
        </h3>
        <table id="tablelistsources" data-pagination="false">
        <!--  <table class="table table-bordered table-condensed">-->
            <thead>
                <tr>            
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.documents" />"><spring:message code="header.documents" /></span></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.transcription" />"><spring:message code="general.transcription" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.date" />"><spring:message code="general.date" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.type" />"><spring:message code="general.type" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.LdoDLabel" />"><spring:message code="general.LdoDLabel" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.format" />"><spring:message code="general.format" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.material" />"><spring:message code="general.material" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.columns" />"><spring:message code="general.columns" /></th>
                    <th><span class="tip" title="<spring:message code="sourcelist.tt.facsimiles" />"><spring:message code="general.facsimiles" /></th>
                </tr>
            <tbody>
                <c:forEach var="source" items='${sources}'>
                    <tr>
                        <td>${source.name}</td>
                        <td><c:forEach var='iter'
                                items='${source.getSourceIntersSet()}'>
                                <a
                                    href="${contextPath}/fragments/fragment/inter/${iter.externalId}">
                                    ${iter.title}</a>
                            </c:forEach></td>
                        <td>${source.getDate().toString("dd-MM-yyyy")}</td>
                        <td><c:choose>
                                <c:when
                                    test='${source.getType()=="MANUSCRIPT"}'>
                                    <c:forEach var='handNote'
                                        items='${source.getHandNoteSet()}'>
                                        <spring:message
                                            code="general.manuscript" />(${handNote.getMedium()})
                                        <br>
                                    </c:forEach>
                                    <c:forEach var='typeNote'
                                        items='${source.getTypeNoteSet()}'>
                                        <spring:message
                                            code="general.typescript" />(${typeNote.getMedium()})
                                        <br>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <spring:message
                                        code="general.printed" />
                                </c:otherwise>
                            </c:choose></td>
                        <td><c:if
                                test='${source.getType()=="MANUSCRIPT"}'>
                                <c:choose>
                                    <c:when
                                        test='${source.getHasLdoDLabel()}'>
                                        <spring:message
                                            code="general.yes" />
                                    </c:when>
                                    <c:otherwise>
                                        <spring:message
                                            code="general.no" />
                                    </c:otherwise>
                                </c:choose>
                            </c:if></td>
                        <td><c:if
                                test='${source.getType()=="MANUSCRIPT"}'>
                                <c:choose>
                                    <c:when
                                        test='${source.getForm()=="LEAF"}'><spring:message
                                            code="general.leaf" /></c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:if></td>
                        <td><c:if
                                test='${source.getType()=="MANUSCRIPT"}'>
                                <c:choose>
                                    <c:when
                                        test='${source.getMaterial()=="PAPER"}'><spring:message
                                            code="general.paper" /></c:when>
                                    <c:otherwise></c:otherwise>
                                </c:choose>
                            </c:if></td>
                        <td><c:if
                                test='${source.getType()=="MANUSCRIPT"}'>${source.getColumns()}</c:if></td>
                        <td><c:forEach var='surface'
                                items='${source.getFacsimile().getSurfaces()}'
                                varStatus="counter">
                                <a href="/facs/${surface.getGraphic()}">(${counter.index+1})
                                    ${source.name} </a>
                                <br>
                            </c:forEach></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
<script>
$('#tablelistsources').attr("data-search","true");
$('#tablelistsources').bootstrapTable();
$(".tip").tooltip({placement: 'bottom'});
</script>
</html>