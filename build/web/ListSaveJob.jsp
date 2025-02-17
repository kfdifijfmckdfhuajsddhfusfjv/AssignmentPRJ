<%-- 
    Document   : ListSaveJob
    Created on : 10 thg 10, 2024, 11:09:44
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Header.jsp" %><br>
        <div class="container">
            <h1 class="text-center mb-5 wow fadeInUp" data-wow-delay="0.1s">Job Listing</h1>
            <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.3s">

                <c:if test="${empty listOfSaveJob}">
                    <p>No jobs available.</p>
                </c:if>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="job-item p-4 mb-4">
                            <c:forEach items="${listOfSaveJob}" var="savejob">
                                <div class="job-item p-4 mb-4">
                                    <div class="row g-4">
                                        <div class="col-sm-12 col-md-8 d-flex align-items-center">
                                            <img class="flex-shrink-0 img-fluid border rounded" src="${savejob.job.company.logoCompany}" alt="" style="width: 80px; height: 80px;">
                                            <div class="text-start ps-4">
                                                <h5 class="mb-3"> 
                                                    <a href="JobDetail?jobId=${savejob.job.jobId}">
                                                        ${savejob.job.jobTitle}
                                                    </a>
                                                </h5>
                                                <span class="text-truncate me-3"><i class="fa fa-map-marker-alt text-primary me-2"></i>${savejob.job.company.companyName}</span>
                                                <span class="text-truncate me-3"><i class="far fa-clock text-primary me-2"></i>${savejob.job.company.location}</span>
                                                <span class="text-truncate me-0"><i class="far fa-money-bill-alt text-primary me-2"></i>${savejob.job.salary}</span>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-12 col-md-2 d-flex flex-column align-items-start align-items-md-end justify-content-center">
                                            <a class="btn btn-danger" href="deleteSaveJob?savejobId=${savejob.saveJobId}">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
