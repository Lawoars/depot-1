require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Подтверждение заказа в магазине Никиток", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["nikitasosnov92@gmail.com"], mail.from
    assert_match "Уважаемый", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Заказ из магазина Никиток отправлен!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["nikitasosnov92@gmail.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
