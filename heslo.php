<?php

function generatePassword($length = 10) {
    // Definování znaků, které se mají použít při generování hesla
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_';

    // Získání délky znaků
    $chars_length = strlen($chars);

    // Inicializace proměnné pro ukládání hesla
    $password = '';

    // Generování hesla
    for ($i = 0; $i < $length; $i++) {
        // Náhodný výběr znaku ze seznamu znaků
        $password .= $chars[rand(0, $chars_length - 1)];
    }

    // Vrácení vygenerovaného hesla
    return $password;
}

// Požadovaná délka hesla (v tomto případě 10)
$password_length = 10;

// Generování hesla s požadovanou délkou
$password = generatePassword($password_length);

?>
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Generátor hesla</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
        }
        .container {
            background-color: white;
            padding: 20px 40px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .logo {
            margin-bottom: 20px;
        }
        .logo img {
            max-width: 100%;
            height: auto;
        }
        h2 {
            margin-bottom: 20px;
        }
        .password {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .btn {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .footer {
            margin-top: 20px;
            text-align: center;
            font-size: 12px;
            color: #777;
        }
    </style>
    <script>
        function generateNewPassword() {
            window.location.reload();
        }

        function copyPassword() {
            var password = document.getElementById("password").innerText;
            navigator.clipboard.writeText(password).then(function() {
                alert("Heslo bylo zkopírováno do schránky.");
            }, function() {
                alert("Kopírování hesla selhalo.");
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="logo.png" alt="Logo firmy - Zahu s.r.o.">
        </div>
        <h2>Generátor hesla</h2>
        <div class="password" id="password"><?php echo $password; ?></div>
        <button class="btn" onclick="generateNewPassword()">Generovat nové heslo</button>
        <button class="btn" onclick="copyPassword()">Zkopírovat heslo</button>
    </div>
    <div class="footer">
        &copy; <?php echo date("Y"); ?> Zahu s.r.o.. Všechna práva vyhrazena.
    </div>
</body>
</html>