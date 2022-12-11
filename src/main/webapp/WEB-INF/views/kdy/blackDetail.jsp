<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #inquirySt{
      margin-top: 50px;
      margin-bottom: 50px;
    }
    #inquiryss{
      margin-left: 350px;
    }
    #inquiryAddBottonST{
      margin-top: 50px;
    }
    #information{
            font-size: 17px;
            font-weight: bold;
        }
  </style>
</head>
<body>
    <c:import url="../common/header.jsp"></c:import>
    <div class="container-fluid">
      <div id="contact" class="contact">
        <div class="container" data-aos="fade-up" id="inquirySt">
            <div class="section-header">
            <h2>${blackDetail[0].report_id}님이 블랙당한 사유(내용) 입니다.</h2>
            </div>
 
            <div class="row gx-lg-0 gy-4">
              <div style="height: 50px;">
                <div class="d-flex">
                  <div class="info-item d-flex" onclick="location.href='/kdy/membersDetail?id=${blackDetail[0].report_id}';">
                      <i class="bi bi-envelope flex-shrink-0"></i>
                      <div>
                        <h4>${blackDetail[0].report_id}님의 회원정보 보러가기</h4>
                      </div>
                  </div>  

                    <div class="info-item d-flex" onclick="location.href='/kdy/membersDetail?id=${blackDetail[0].id}';">
                    <i class="bi bi-envelope flex-shrink-0"></i>
                    <div>
                      <h4>신고자 ${blackDetail[0].id}님의 회원정보 보러가기</h4>
                      <p>${reportDetail.report_date}</p>
                    </div>
                  </div><!-- End Info Item -->
                </div>
            </div>
            <div class="col-lg-8 php-email-form" style="margin-bottom: 90px;">

                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="information" style="border: 0;"   readonly value="블랙회원 : ${blackDetail[0].report_id} 님">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="신고자 : ${blackDetail[0].id}님">
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="text" class="form-control" name="email" id="information" style="border: 0;"  readonly value="신고일 : ${blackDetail[0].report_date}">
                </div>
                <div class="form-group mt-3">
                  <div id="information">신고 내용 : </div>
                  <textarea class="form-control" name="inquiryDetail_contents" id="inquiryDetail_contents" rows="7" readonly>${blackDetail[0].report_contents}</textarea>
                </div>

                    <c:choose>
                      <c:when test="${empty blackDetail[0].reportFileVOs[0].report_fileName}">                        
                      </c:when>
                      <c:otherwise>
                        <section id="faq" class="faq">
                          <div class="container" data-aos="fade-up" style="margin-left: 150px; margin-top: -45px;">
                            <div class="row gy-4">
                              <div class="col-lg-8">
                                <div class="accordion accordion-flush" id="faqlist" data-aos="fade-up" data-aos-delay="100">
                                  <div class="accordion-item">
                                    <h3 class="accordion-header">
                                      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq-content-1">
                                        <span class="num">-</span>
                                        ${reportDetail.id}님이 첨부한 파일을 확인해주세요
                                      </button>
                                    </h3>
                                    <div id="faq-content-1" class="accordion-collapse collapse" data-bs-parent="#faqlist">
                                      <div class="accordion-body">
                                        <c:forEach items="${reportDetail.reportFileVOs}" var="reportFile">
                                          <img alt="" src="/file/membersFile/${reportFile.report_fileName}">
                                        </c:forEach>  
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </section>
                      
                      </c:otherwise>
                    </c:choose> 
              
              <div class="d-flex" style="margin-left: 450px;">
                <div class="text-center" id="inquiryAddBottonST" onclick="location.href='/kdy/balckCancel?report_id=${blackDetail[0].report_id}';">
                  <button type="submit" id="inquiryAddBtn">블랙 해제</button>
                </div>
                <div class="text-center" id="inquiryAddBottonST" onclick="location.href='/kdy/memberBlackList';">
                  <button type="submit" id="inquiryAddBtn">뒤로가기</button>
                </div>
              </div>
          </div>
            </div>
        </div>
      </div>
    </div>  
        <script src="js/inquiryRequest.js"></script>
        <c:import url="../common/footer.jsp"></c:import>
</body>
</html>