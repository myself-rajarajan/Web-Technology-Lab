<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Examination Quiz</title>
    <script>
        let timerDuration = 30;
        let interval;
        function startTimer() {
            let countdownDisplay = document.getElementById("timer");
            let submitButton = document.getElementById("submitButton");
            submitButton.disabled = true;
            interval = setInterval(() => {
                if (timerDuration > 0) {
                    timerDuration--;
                    countdownDisplay.innerText = "Time Left: " + timerDuration + "s";
                } else {
                    clearInterval(interval);
                    submitButton.disabled = false;
                }
            }, 1000);
        }
        function submitQuiz() {
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "submitQuiz.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            let answers = [];
            answers.push(document.querySelector('input[name="q4"]:checked').value);
            answers.push(document.querySelector('input[name="q5"]:checked').value);
            answers.push(document.querySelector('input[name="q6"]:checked').value);
            xhr.send("answers=" + JSON.stringify(answers));
            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("Quiz submitted! " + xhr.responseText);
                }
            };
        }

        window.onload = startTimer;
    </script>
</head>
<body>
    <h2>Online Examination Quiz</h2>

    <div id="timer" style="color: red; font-weight: bold;">Time Left: 30s</div>

    <form id="quizForm">
        <p>1. What is Walter White's alias?</p>
        <label><input type="radio" name="q4" value="Heisenberg"> Heisenberg</label><br>
        <label><input type="radio" name="q4" value="Gus Fring"> Gus Fring</label><br>
        <label><input type="radio" name="q4" value="Saul Goodman"> Saul Goodman</label><br><br>

        <p>2. Who is Jesse Pinkman's former high school teacher?</p>
        <label><input type="radio" name="q5" value="Walter White"> Walter White</label><br>
        <label><input type="radio" name="q5" value="Hank Schrader"> Hank Schrader</label><br>
        <label><input type="radio" name="q5" value="Gus Fring"> Gus Fring</label><br><br>

        <p>3. What is the name of the fast food chain owned by Gus Fring?</p>
        <label><input type="radio" name="q6" value="Los Pollos Hermanos"> Los Pollos Hermanos</label><br>
        <label><input type="radio" name="q6" value="Pizza Planet"> Pizza Planet</label><br>
        <label><input type="radio" name="q6" value="Chicken King"> Chicken King</label><br><br>

        <button type="button" id="submitButton" onclick="submitQuiz()">Submit Quiz</button>
    </form>
</body>
</html>
