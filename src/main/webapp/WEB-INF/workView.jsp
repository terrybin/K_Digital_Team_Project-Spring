<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- 곽규창(Kyle) --%>
<!DOCTYPE html>
<html lang="ko">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>CoWorkers</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/coWorkers.css" rel="stylesheet">
</head>

<body>

<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="date" class="java.util.Date"/>
<%
    System.out.println(pageContext.findAttribute("dto"));

    Map<String, String[]> map = request.getParameterMap();
    Iterator<Map.Entry<String, String[]>> itr = map.entrySet().iterator();
    while(itr.hasNext())
    {
        Map.Entry<String, String[]> entry = itr.next();
        System.out.println(String.format("%s : %s", entry.getKey(),String.join(", ", entry.getValue())));
    }
%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">CoWorkers</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="boardList.sil">게시판<span class="sr-only"></span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="work.sil">업무</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="#">캘린더</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

            <div class="table-responsive">

                <form action="workUpdate.sil" method="post">
                    <table class="table" style="width:1500px; margin-left: auto; margin-right: auto;">
                        <tr class="bg-info">
                            <th colspan="15" style="font-size: 30px; text-align: center;">업무</th>
                        </tr>
                        <tr class="table-success">
                            <th class="align-middle table-dark" style="width: 100px; text-align: center;">글번호</th>
                            <th class="align-middle table-dark" style="width: 100px; text-align: center;">우선순위</th>
                            <th class="align-middle table-dark" style="width: 100px; text-align: center;">상태</th>
                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">담당자</th>
                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">진척도</th>
                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">작성일</th>
                            <%--                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">수정일</th>--%>
                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">시작일</th>
                            <th class="align-middle table-dark" style="width: 200px; text-align: center;">마감일</th>
                        </tr>
                        <c:set var="list" value="${workList.list}"/>
                        <tr>
                            <td align="center">${dto.workID}</td>
                            <td align="center">${dto.priority}</td>

                            <td align="center">
                                ${dto.currentProgress}
                            </td>
                            </td>
                            <td align="center">
                                <c:set var="userName" value="${fn:replace(dto.userName, '<', '&lt;')}"/>
                                <c:set var="userName" value="${fn:replace(userName, '>', '&gt;')}"/>
                                ${userName}
                            </td>
                            <td align="center">
                                ${dto.workProgress}
                            </td>
                            <%--                            <td align="center">--%>
                            <%--                                <c:if test="${dto.updateDate.year==date.year&&dto.writeDate.month==date.month&&dto.updateDate.date==date.date}">--%>
                            <%--                                    <fmt:formatDate value="${dto.updateDate}" pattern="a h:mm:ss"/>--%>
                            <%--                                </c:if>--%>
                            <%--                                <c:if test="${dto.updateDate.year!=date.year||dto.writeDate.month!=date.month||dto.updateDate.date!=date.date}">--%>
                            <%--                                    <fmt:formatDate value="${dto.updateDate}" pattern="MM/dd"/>--%>
                            <%--                                </c:if>--%>
                            <%--                            </td>--%>
                            <td align="center">
                                <c:if test="${dto.writeDate.year==date.year&&dto.writeDate.month==date.month&&dto.writeDate.date==date.date}">
                                    <fmt:formatDate value="${dto.writeDate}" pattern="a h:mm:ss"/>
                                </c:if>
                                <c:if test="${dto.writeDate.year!=date.year||dto.writeDate.month!=date.month||dto.writeDate.date!=date.date}">
                                    <fmt:formatDate value="${dto.writeDate}" pattern="MM/dd"/>
                                </c:if>
                            </td>
                            <td align="center">
                                <fmt:formatDate value="${dto.startDate}" pattern="yyyy.MM.dd.(E)"/>
                            </td>
                            <td align="center">
                                <fmt:formatDate value="${dto.deadline}" pattern="yyyy.MM.dd.(E)"/>
                            </td>
                        </tr>
                        <tr>
                            <th>제목
                            </th>
                            <td colspan="9">
                                <c:set var="subject" value="${fn:replace(dto.subject, '<', '&lt;')}"/>
                                <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                ${subject}
                            </td>
                        </tr>
                        <tr>
                            <th>내용
                            </th>
                            <td colspan="9">
                                <c:set var="content" value="${fn:replace(dto.content, '<', '&lt;')}"/>
                                <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                                ${content}
                            </td>
                        </tr>
                    </table>
                    <table width="600" align="center" cellpadding="5" cellspacing="0">
                        <tr class="table-secondary">
                            <td align="center">
                                <input class="btn btn-primary btn-sm" type="submit" value="수정"
                                       style="font-size: 13px; width: 80px"/>
                                <input class="btn btn-danger btn-sm" type="button" value="삭제"
                                       style="font-size: 13px; width: 80px"
                                       onclick="location.href='workDelete.sil?workID=${dto.workID}&currentPage=${currentPage}'"/>
                                <input class="btn btn-info btn-sm" type="button" value="돌아가기"
                                       style="font-size: 13px; width: 80px"
                                       onclick="history.back()"/>

                                <input type="hidden" name="workID" value="${dto.workID}"/>
                                <input type="hidden" name="currentPage" value="${currentPage}"/>
                                <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</div>

<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/worInsert.js"></script>
</body>

</html>