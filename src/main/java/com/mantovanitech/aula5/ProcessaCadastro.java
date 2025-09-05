package com.mantovanitech.aula5;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.stream.Collectors;

@WebServlet("/ProcessaCadastro")
public class ProcessaCadastro extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    process(req, resp, false); // GET: não exige senha
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    process(req, resp, true); // POST: valida senha/confirmarSenha
  }

  private void process(HttpServletRequest req, HttpServletResponse resp, boolean validarSenha)
      throws ServletException, IOException {
    req.setCharacterEncoding("UTF-8");

    String nome = param(req, "nome");
    String email = param(req, "email");
    String telefone = param(req, "telefone");
    String[] interesses = req.getParameterValues("interesses");
    String senha = param(req, "senha");
    String confirmarSenha = param(req, "confirmarSenha");

    StringBuilder erros = new StringBuilder();
    if (isBlank(nome) || nome.length() < 3) append(erros, "Nome inválido (mín. 3 caracteres).");
    if (isBlank(email)) append(erros, "E-mail é obrigatório.");
    if (isBlank(telefone) || !telefone.matches("\\d{11}")) append(erros, "Telefone deve ter 11 dígitos.");
    if (validarSenha) {
      if (isBlank(senha) || isBlank(confirmarSenha)) append(erros, "Senha e confirmação são obrigatórias.");
      else if (!senha.equals(confirmarSenha)) append(erros, "As senhas não coincidem.");
    }

    if (erros.length() > 0) {
      req.setAttribute("msg", erros.toString());
      req.setAttribute("nome", nome);
      req.setAttribute("email", email);
      req.setAttribute("telefone", telefone);
      req.setAttribute("interesses", interesses);
      req.getRequestDispatcher("erro.jsp").forward(req, resp);
      return;
    }

    String interessesStr = (interesses == null || interesses.length == 0) ? "Nenhum" :
        Arrays.stream(interesses).collect(Collectors.joining(", "));

    req.setAttribute("usuario", nome);
    req.setAttribute("interessesStr", interessesStr);
    req.getRequestDispatcher("sucesso.jsp").forward(req, resp);
  }

  private String param(HttpServletRequest req, String name) {
    String v = req.getParameter(name);
    return v != null ? v.trim() : "";
  }

  private boolean isBlank(String s) {
    return s == null || s.trim().isEmpty();
  }

  private void append(StringBuilder sb, String msg) {
    if (sb.length() > 0) sb.append(' ');
    sb.append(msg);
  }
}

