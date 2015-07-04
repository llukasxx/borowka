class DayDecorator < Draper::Decorator
  include ActionView::Helpers::NumberHelper
  delegate_all
  def sum
    all = (blueberry.kg*blueberry.rate) + (raspberry.kg*raspberry.rate) + 
          (blackberry.kg*blackberry.rate) + (hour.amount*hour.rate) + food

    number_to_currency(all, :unit=>'€')
  end

end
