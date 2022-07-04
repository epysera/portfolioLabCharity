<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>

<%--@elvariable id="donation" type="pl.coderslab.charity.entity.Donation"--%>
<%@include file="fragments/headerForm.jsp" %>
<div>
<!-- STEP 6 -->
    <section class="form--steps">
<form action="conf" method="post" modelAttribute="donation">
    <div class="form--steps-container" style="display: initial">
<div data-step="5" class="active form-group--inline">
    <h3>Podsumowanie Twojej darowizny</h3>

    <div class="summary">
        <div class="form-section">
            <h4>Oddajesz:</h4>
            <ul>
                <li>
                    <span class="icon icon-bag"></span>
                    <span class="summary--text">
                        <c:out value="${donation.quantity}"></c:out> worki
                            <c:forEach var="item" items="${donation.categories}">
                                <c:out value="${item.name}"></c:out> </c:forEach></span
                    >
                </li>

                <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text">
                        Dla fundacji <c:out value="${donation.institution.name}"></c:out></span
                    >
                </li>
            </ul>
        </div>

        <div class="form-section form-section--columns">
            <div class="form-section--column">
                <h4>Adres odbioru:</h4>
                <ul>
                    <li><c:out value="${donation.street}"></c:out></li>
                    <li><c:out value="${donation.city}"></c:out></li>
                    <li><c:out value="${donation.zipCode}"></c:out></li>

                </ul>
            </div>

            <div class="form-section--column">
                <h4>Termin odbioru:</h4>
                <ul>
                    <li><c:out value="${donation.pickUpDate}"></c:out></li>
                    <li><c:out value="${donation.pickUpTime}"></c:out></li>
                    <li><c:out value="${donation.pickUpComment}"></c:out></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="form-group form-group--buttons">
        <button type="button" class="btn prev-step">Wstecz</button>
        <button type="submit" class="btn">Potwierdzam</button>
    </div>
</div>
    </div>
</form>
    </section>
</div>

<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>