# Aula 5 — Formulários e Manipulação de Dados (Servlet + JSP)

Projeto pronto para Tomcat 9 (Servlet API javax.*).

## Estrutura
- `src/main/webapp/` — HTML/JSP
  - `cadastro.html` (POST)
  - `cadastro_get.html` (GET)
  - `sucesso.jsp`, `erro.jsp`
- `src/main/java/com/mantovanitech/aula5/ProcessaCadastro.java` — Servlet
- `WEB-INF/web.xml` — minimal
- `pom.xml` — build com Maven

## Como rodar
Opção A — Tomcat embutido (rápida)

1. Pré-requisitos: JDK 8+ e Maven 3.8+.
2. Execute:
   ```bash
   mvn clean package tomcat7:run
   ```
3. Acesse:
   - `http://localhost:8080/aula5-formularios/` (abre `cadastro.html`)
   - Compare GET/POST abrindo `cadastro_get.html`

Opção B — Tomcat externo (produção/aula)

1. Pré-requisitos: JDK 8+, Maven 3.8+, Tomcat 9.x.
2. Build:
   ```bash
   mvn clean package
   ```
3. Copie `target/aula5-formularios.war` para `TOMCAT_HOME/webapps/`.
4. Inicie o Tomcat e acesse os mesmos endereços acima.

> Se você usa Tomcat 10+, precisará migrar imports para `jakarta.servlet.*` e ajustar a dependência.
