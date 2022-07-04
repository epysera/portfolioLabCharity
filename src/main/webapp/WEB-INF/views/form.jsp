<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>

<%@include file="fragments/headerForm.jsp" %>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <%--@elvariable id="donation" type="pl.coderslab.charity.entity.Donation"--%>
        <form:form action="/form" modelAttribute="donation" method="post" name="form">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                    <%--c:forEach <form:checkbox path=""--%>
                <form:checkboxes path="categories" items="${categories}" itemLabel="name" itemValue="id"
                                 class="category"
                                 cssClass="form-group form-group--checkbox checkbox description"></form:checkboxes>
                <form:errors path="categories" cssClass="error"/>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        <form:input path="quantity" step="1" min="1" id="quantity"/>
                        <form:errors path="quantity" cssClass="error"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

                <form:radiobuttons path="institution" items="${institutions}" itemLabel="name" id="institution"
                                   cssClass="form-group form-group--checkbox description"/>
                <form:errors path="institution" cssClass="error"/>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica
                                <form:input path="street"/>
                                <form:errors path="street" cssClass="error"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto
                                <form:input path="city"/>
                                <form:errors path="city" cssClass="error"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy
                                <form:input path="zipCode"/>
                                <form:errors path="zipCode" cssClass="error"/>
                            </label>
                        </div>

<%--                        <div class="form-group form-group--inline">--%>
<%--                            <label>--%>
<%--                                Numer telefonu--%>
<%--                                <form:input path="phoneNumber" id="phoneNumberData"/>--%>
<%--                                <form:errors path="phoneNumber" cssClass="error"/>--%>
<%--                            </label>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data
                                <form:input type="date" path="pickUpDate"/>
                                <form:errors type="date" path="pickUpDate" cssClass="error"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina
                                <form:input type="time" path="pickUpTime"/>
                                <form:errors type="time" path="pickUpTime" cssClass="error"/>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment"/>
                                <form:errors path="pickUpComment" cssClass="error"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
<%--            <div data-step="5">--%>
<%--                <h3>Podsumowanie Twojej darowizny</h3>--%>

<%--                <div class="summary">--%>
<%--                    <div class="form-section">--%>
<%--                        <h4>Oddajesz:</h4>--%>
<%--                        <ul>--%>
<%--                            <li>--%>
<%--                                <span class="icon icon-bag"></span>--%>
<%--                                <span class="summary--text">${sumOfBags}--%>
<%--                                </span>--%>
<%--                            </li>--%>

<%--                            <li>--%>
<%--                                <span class="icon icon-hand"></span>--%>
<%--                                <span class="summary--text">${institution.name}--%>
<%--                                </span>--%>
<%--                            </li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                    <div class="form-section form-section--columns">--%>
<%--                        <div class="form-section--column">--%>
<%--                            <h4>Adres odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li${donation.street}></li>--%>
<%--                                <li${donation.city}></li>--%>
<%--                                <li${donation.zipCode}></li>--%>

<%--                            </ul>--%>
<%--                        </div>--%>

<%--                        <div class="form-section--column">--%>
<%--                            <h4>Termin odbioru:</h4>--%>
<%--                            <ul>--%>
<%--                                <li${donation.pickUpDate}>--%>
<%--                                </li>--%>
<%--                                <li${donation.pickUpTime}>--%>
<%--                                </li>--%>
<%--                                <li${donation.pickUpComment}>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="form-group form-group--buttons">--%>
<%--                    <button type="button" class="btn prev-step">Wstecz</button>--%>
<%--                    <button type="submit" class="btn">Potwierdzam</button>--%>
<%--                </div>--%>
<%--            </div>--%>
        </form:form>
    </div>
</section>

<%@include file="fragments/footer.jsp" %>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>