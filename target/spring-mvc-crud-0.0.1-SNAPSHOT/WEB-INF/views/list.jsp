<%--
  Created by IntelliJ IDEA.
  User: hetingrui
  Date: 2020/7/31
  Time: 8:54 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Employee List</title>
<%--    以/相对路径开始, 以服务器路径为标准--%>

    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript"
            src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <link
            href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
            rel="stylesheet">
    <script
            src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Spring-MVC-CRUD</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary">Add</button>
                <button class="btn btn-danger">Delete</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-striped">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>operation</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                    <tr>
                        <th>${emp.empId}</th>
                        <th>${emp.empName}</th>
                        <th>${emp.gender=="M" ? "M":"F"}</th>
                        <th>${emp.email}</th>
                        <th>${emp.department.deptNam3e}</th>
                        <th>
                            <button class="btn btn-primary btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                edit</button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                delete</button>

                        </th>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6">page: ${pageInfo.pageNum}, total: ${pageInfo.pages}
                , total record: ${pageInfo.total} </div>
            <!-- 分页条信息 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH }/emps?pn=1">First</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}"
                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage }">
                            <li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }"
                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>
                        <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">Last</a></li>
                    </ul>
                </nav>
            </div>
        </div>




    </div>
</body>
</html>
