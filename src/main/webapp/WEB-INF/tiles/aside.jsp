<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
    <nav class="sidebar sidebar-sticky">
        <div class="sidebar-content">
            <a class="sidebar-brand" href="index.html">
                <i class="align-middle" data-feather="truck"></i>
                <span class="align-middle">eTransport</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    Main
                </li>
                <li class="sidebar-item active">
                    <a href="index.html" class="sidebar-link">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                        <span class="sidebar-badge badge badge-primary">6</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#pages" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="file"></i> <span class="align-middle">Basic Form</span>
                    </a>
                    <ul id="pages" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/brands">Brand</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="pages-sign-up.html">Brand Model</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/transport_type">Transport Type</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="pages-blank.html">Venue</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="pages-invoice.html">Transport Information</a></li>
                    </ul>
                </li>
                
                <li class="sidebar-item">
                    <a href="#travel-trip" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="file"></i> <span class="align-middle">Travel/Trip</span>
                    </a>
                    <ul id="travel-trip" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="pages-sign-in.html">Transport Schedule</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/view-scheduled-transport-information">Scheduled Travel Information</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/transportrequisition">Transport Requisition</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/transport-requisition-approval">Transport Requisition Approval</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/transport-assign">Transport Assign</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/generaltravelinformation">General Travel Information</a></li>
                        
                    </ul>
                </li>
                
                <li class="sidebar-item">
                    <a href="#layouts" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Employee</span>
                    </a>
                    <ul id="layouts" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/driverinformation">Driver<span class="sidebar-badge badge badge-primary">New</span></a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="layouts-sidebar-collapsed.html">Helper</a></li>
                        
                    </ul>
                </li>
                
                <li class="sidebar-header">
                    Reports
                </li>
                <li class="sidebar-item">
                    <a href="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="grid"></i> <span class="align-middle">Catg1 Report</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-alerts.html">Alerts</a></li>
                   
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#charts" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="pie-chart"></i> <span class="align-middle">Catg2 Report</span>
                    </a>
                    <ul id="charts" class="sidebar-dropdown list-unstyled collapse ">
                        <li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/brands">Create User</a></li>
                    </ul>
                </li>
                <li class="sidebar-item">
                	<li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/home">Home</a></li>
                </li>
                <li class="sidebar-item">
                	<li class="sidebar-item"><a class="sidebar-link" href="${pageContext.request.contextPath}/test1">Test1</a></li>
                </li>
                

            </ul>

        </div>
    </nav>
</sec:authorize>