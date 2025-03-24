class HomePage

  SEARCH_BAR = { id: 'twotabsearchtextbox' }
  SEARCH_BUTTON = { id: 'nav-search-submit-button' }
  SEARCH_RESULTS = { css: 'div.s-main-slot div[data-component-type="s-search-result"] h2' }

  def initialize(driver)
    @driver = driver
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
  end

  def enter_search_term(term)
    search_bar = @wait.until { @driver.find_element(SEARCH_BAR) }
    search_bar.clear
    search_bar.send_keys(term)
  end

  def click_search_button
    @wait.until { @driver.find_element(SEARCH_BUTTON) }.click
  end

  def results_loaded?
    @wait.until do
      results = @driver.find_elements(SEARCH_RESULTS)
      results.any? { |result| result.displayed? }
    end
    true
  rescue Selenium::WebDriver::Error::TimeoutError
    false
  end

  def get_search_results
    elements = @wait.until { @driver.find_elements(SEARCH_RESULTS) }
    
    results = elements.map { |el| el.text&.strip }.compact
    results.reject(&:empty?)
  end
end
