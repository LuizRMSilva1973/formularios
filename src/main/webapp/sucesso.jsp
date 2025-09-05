<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sucesso</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 720px; margin: 2rem auto; }
  </style>
</head>
<body>
  <h1>Cadastro concluído!</h1>
  <p>Bem-vindo, <strong>${usuario}</strong>.</p>
  <p>Interesses: <strong>${interessesStr}</strong></p>
  <%
    String dataAtual = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss")
                         .format(new java.util.Date());
  %>
  <p>Data de processamento: <%= dataAtual %></p>
  <p><a href="cadastro.html">Voltar</a></p>
</body>
</html>
