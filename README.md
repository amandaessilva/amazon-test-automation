# Test Automation - Busca na Amazon  

Este projeto realiza testes automatizados na Amazon utilizando **Ruby** e **Selenium WebDriver**.

---

## Estrutura do Projeto

    /test-automation
    ├── home_page.rb # Página de busca utilizando o Page Object Model
    └── test_search.rb # Teste automatizado da busca na Amazon


---

## Pré-requisitos

Antes de rodar o teste, certifique-se de que os seguintes itens estão instalados:

- **Ruby** (versão 2.7 ou superior) → [Instalar Ruby](https://www.ruby-lang.org/pt/downloads/)
- **Bundler** (para gerenciar dependências Ruby)  
- **Google Chrome** (última versão) → [Baixar Chrome](https://www.google.com/intl/pt-BR/chrome/)
- **ChromeDriver** (compatível com a versão do Chrome) → [Baixar ChromeDriver](https://sites.google.com/chromium.org/driver/)

---

## Instalação

1. **Clone o repositório**:
    ```bash
    git clone https://github.com/amandaessilva/amazon-test-automation
    cd amazon-test-automation
    ```

2. **Instale as dependências do Selenium**:
    ```bash
    gem install selenium-webdriver
    ```

3. **(Opcional) Configure o Bundler**:
    Se você estiver usando um `Gemfile`, instale as dependências com:
    ```bash
    bundle install
    ```

---

## Executando os Testes

Para rodar o teste de busca na Amazon, execute:

```bash
ruby test_search.rb
```


## Como o Teste Funciona?

    Abre o site da Amazon

    Realiza uma busca por um produto específico

    Valida se o produto pesquisado aparece nos resultados

## Arquivos Explicados

    home_page.rb
    Contém a estrutura da página de busca, utilizando o Page Object Model (POM) para melhor organização do código.

    test_search.rb
    Executa o teste automatizado e valida os resultados.

## Possíveis Erros e Soluções

    Erro: Selenium::WebDriver::Error::WebDriverError: no such session
    Solução: Verifique se o ChromeDriver está instalado corretamente.

    Erro: TimeoutError: O teste falhou devido a um tempo limite atingido
    Solução: Verifique se o seletor dos elementos está correto.

## Licença

    Este projeto é de uso livre para aprendizado e melhorias.
