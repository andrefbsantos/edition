<%@ include file="/WEB-INF/jsp/common/tags-head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/meta-head.jsp"%>
</head>
<body>
    <%@ include file="/WEB-INF/jsp/common/fixed-top-ldod-header.jsp"%>

    <div class="container">
    	<div class="row">
    	<div class="col-xs-3 col-md-3">
    	</div>
    	<div class="col-xs-6 col-md-6">
        <h1 class="text-center">
            <spring:message code="virtual.editions" />
        </h1>
        </div>
       <div class="col-xs-3 col-md-3" align="right" style="margin-top:20px;margin-bottom:10px">
       		<a class="btn btn-primary tip" title="<spring:message code="virtualedition.tt.create" />" role="button" data-toggle="collapse" href="#collapse" aria-expanded="false" aria-controls="collapse">
 			<span class="glyphicon glyphicon-plus"></span>
            <spring:message code="general.create" />
			</a>
			</div>
        </div>
        <br>
        <div class="row">
            <c:forEach var="error" items='${errors}'>
                <div class="row text-error">
                    <spring:message code="${error}" />
                </div>
            </c:forEach>
        </div>
        <div class="row">
            
<div class="collapse" id="collapse">
  <div class="well">
      <form class="form-inline" method="POST"
                action="/virtualeditions/restricted/create">
                <div class="form-group">
                    <input type="text" class="form-control tip"
                        name="acronym"
                        placeholder="<spring:message code="virtualeditionlist.acronym" />"
                        value="${acronym}" title="<spring:message code="virtualedition.tt.acronym" />"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control tip" name="title"
                        placeholder="<spring:message code="virtualeditionlist.name" />"
                        value="${title}" title="<spring:message code="virtualedition.tt.title" />"/>
                </div>
                <div class="form-group">
                    <select class="form-control tip" name="pub" title="<spring:message code="virtualedition.tt.access" />">
                        <c:choose>
                            <c:when test="${pub == false}">
                                <option value="true">
                                    <spring:message
                                        code="general.public" />
                                </option>
                                <option value="false" selected>
                                    <spring:message
                                        code="general.private" />
                                </option>
                            </c:when>
                            <c:otherwise>
                                <option value="true" selected>
                                    <spring:message
                                        code="general.public" />
                                </option>
                                <option value="false">
                                    <spring:message
                                        code="general.private" />
                                </option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <div class="form-group">
                    <select class="form-control tip" name="use" title="<spring:message code="virtualedition.tt.use" />"><option
                            value="no"><spring:message
                                code="tableofcontents.usesEdition" /></option>
                        <c:forEach var='expertEdition'
                            items='${expertEditions}'>
                            <option
                                value='${expertEdition.getExternalId()}'>${expertEdition.getEditor()}</option>
                        </c:forEach>
                        <c:forEach var='virtualEdition'
                            items='${virtualEditions}'>
                            <option
                                value='${virtualEdition.getExternalId()}'>${virtualEdition.getAcronym()}</option>
                        </c:forEach></select>
                </div>
                <button type="submit" class="btn btn-primary">
                    <span class="glyphicon glyphicon-edit"></span>
                    <spring:message code="general.create" />
                </button>
            </form>
  </div>
</div>
        </div>
        <div class="row">
            
        </div>
        <br />
        <div class="row">
            <div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.acronym" />">
                            <spring:message
                                    code="virtualeditionlist.acronym" /></span></th>
                            <th>
                            <span class="tip" title="<spring:message code="virtualedition.tt.title" />">
                            <spring:message
                                    code="virtualeditionlist.name" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.date" />">
                            <spring:message code="general.date" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.access" />"><spring:message
                                    code="general.access" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.select" />"><spring:message
                                    code="general.select" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.edit" />"><spring:message code="general.edit" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.participants" />"><spring:message
                                    code="general.participants" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.taxonomies" />"><spring:message
                                    code="general.taxonomies" /></span></th>
							<th><span class="tip" title="<spring:message code="virtualedition.tt.recommendations" />"><spring:message
                                    code="general.recommendations" /></span></th>
                            <th><span class="tip" title="<spring:message code="virtualedition.tt.delete" />"><spring:message
                                    code="general.delete" /></span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="virtualEdition"
                            items='${virtualEditions}'>
                            <tr>
                                <td>${virtualEdition.acronym}</td>
                                <td>${virtualEdition.title}</td>
                                <td>${virtualEdition.getDate().toString("dd-MM-yyyy")}</td>
                                <td><c:choose>
                                        <c:when
                                            test="${virtualEdition.pub}">
                                            <spring:message
                                                code="general.public" />
                                        </c:when>
                                        <c:otherwise>
                                            <spring:message
                                                code="general.private" />
                                        </c:otherwise>
                                    </c:choose></td>
                                <td><form class="form-inline"
                                        method="POST"
                                        action="${contextPath}/virtualeditions/toggleselection">
                                        <input type="hidden"
                                            name="externalId"
                                            value="${virtualEdition.externalId}" />
                                        <button type="submit"
                                            class="btn btn-primary btn-sm">
                                            <span
                                                class="glyphicon glyphicon-check"></span>
                                            <c:choose>
                                                <c:when
                                                    test="${ldoDSession.selectedVEs.contains(virtualEdition)}">
                                                    <spring:message
                                                        code="general.deselect" />
                                                </c:when>
                                                <c:otherwise>
                                                    <spring:message
                                                        code="general.select" />
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </form></td>
                                <c:choose>
                                    <c:when
                                        test="${virtualEdition.participantSet.contains(user)}">
                                        <td><a class="btn btn-sm"
                                            href="${contextPath}/virtualeditions/restricted/editForm/${virtualEdition.externalId}"><span
                                                class="glyphicon glyphicon-edit"></span>
                                                <spring:message
                                                    code="general.edit" /></a></td>
                                        <td><a class="btn btn-sm"
                                            href="${contextPath}/virtualeditions/restricted/participantsForm/${virtualEdition.externalId}"><span
                                                class="glyphicon glyphicon-user"></span>
                                                <spring:message
                                                    code="general.participants" /></a></td>
                                        <td><a class="btn btn-sm"
                                            href="${contextPath}/virtualeditions/restricted/${virtualEdition.externalId}/taxonomy"><span
                                                class="glyphicon glyphicon-tags"></span>
                                                <spring:message
                                                    code="general.taxonomies" /></a></td>
										<td><a class="btn btn-sm"
                                            href="${contextPath}/recommendation/restricted/${virtualEdition.externalId}"><span
                                                class="glyphicon glyphicon-wrench"></span>
                                                <spring:message
                                                    code="general.recommendations" /></a>
											
										</td>
                                        <td>
                                            <form class="form-inline"
                                                method="POST"
                                                action="${contextPath}/virtualeditions/restricted/delete">
                                                <input type="hidden"
                                                    name="externalId"
                                                    value="${virtualEdition.externalId}" />
                                                <button type="submit"
                                                    class="btn btn-primary btn-sm">
                                                    <span
                                                        class="glyphicon glyphicon-remove"></span>
                                                    <spring:message
                                                        code="general.delete" />
                                                </button>
                                            </form>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
<script>
$(".tip").tooltip({placement: 'bottom'});
</script>
</html>