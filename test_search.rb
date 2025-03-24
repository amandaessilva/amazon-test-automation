require 'selenium-webdriver'
require_relative 'home_page'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--start-maximized')

if RUBY_PLATFORM.include?('darwin')
  options.add_argument('--kiosk')
end

driver = Selenium::WebDriver.for :chrome, options: options
wait = Selenium::WebDriver::Wait.new(timeout: 10)

begin
  driver.get('https://www.amazon.com.br/')

  home_page = HomePage.new(driver)

  search_term = 'O Deus que destrói sonhos'

  home_page.enter_search_term(search_term)
  home_page.click_search_button

  wait.until { home_page.results_loaded? }

  search_results = home_page.get_search_results
  if search_results.any? { |result| result.downcase.include?(search_term.downcase) }
    puts "Teste passou! O item '#{search_term}' foi encontrado nos resultados."
  else
    raise "Teste falhou! O item '#{search_term}' não foi encontrado nos resultados."
  end

rescue Selenium::WebDriver::Error::TimeoutError
  puts "Erro: O teste falhou devido a um tempo limite atingido ao carregar a página."
rescue StandardError => e
  puts "Erro durante a execução do teste: #{e.message}"
ensure
  driver.quit
end
