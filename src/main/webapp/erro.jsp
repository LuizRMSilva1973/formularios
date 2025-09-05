<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Erros no cadastro</title>
  <style>
    body { font-family: Arial, sans-serif; max-width: 720px; margin: 2rem auto; }
    .erro { color: #b00020; background: #ffe5e5; padding: .75rem; border-radius: .25rem; }
    label { display:block; margin-top: .75rem; }
    input, button { padding:.5rem; margin-top:.25rem; }
    .grupo { margin-bottom: 1rem; }
  </style>
</head>
<body>
  <h1>Corrija os campos abaixo</h1>
  <div class="erro"><%= request.getAttribute("msg") %></div>

  <form action="ProcessaCadastro" method="post">
    <div class="grupo">
      <label for="nome">Nome</label>
      <input id="nome" name="nome" type="text" value="<%= request.getAttribute("nome") != null ? request.getAttribute("nome") : "" %>" required minlength="3" maxlength="60">
    </div>

    <div class="grupo">
      <label for="email">E-mail</label>
      <input id="email" name="email" type="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
    </div>

    <div class="grupo">
      <label for="telefone">Telefone (11 dígitos)</label>
      <input id="telefone" name="telefone" type="text" pattern="\d{11}" placeholder="11987654321"
             value="<%= request.getAttribute("telefone") != null ? request.getAttribute("telefone") : "" %>" required>
    </div>

    <fieldset class="grupo">
      <legend>Interesses</legend>
      <%
        String[] sel = (String[]) request.getAttribute("interesses");
        boolean e = false, m = false, t = false;
        if (sel != null) {
          for (String s : sel) {
            if ("esporte".equals(s)) e = true;
            if ("musica".equals(s))  m = true;
            if ("tecnologia".equals(s)) t = true;
          }
        }
      %>
      <label><input type="checkbox" name="interesses" value="esporte" <%= e ? "checked" : "" %>> Esporte</label>
      <label><input type="checkbox" name="interesses" value="musica" <%= m ? "checked" : "" %>> Música</label>
      <label><input type="checkbox" name="interesses" value="tecnologia" <%= t ? "checked" : "" %>> Tecnologia</label>
    </fieldset>

    <div class="grupo">
      <label for="senha">Senha</label>
      <input id="senha" name="senha" type="password" minlength="8" required>
    </div>

    <div class="grupo">
      <label for="confirmarSenha">Confirmar Senha</label>
      <input id="confirmarSenha" name="confirmarSenha" type="password" minlength="8" required>
    </div>

    <button type="submit">Enviar novamente</button>
  </form>
  <p><a href="cadastro.html">Cancelar e voltar</a></p>
</body>
</html>
