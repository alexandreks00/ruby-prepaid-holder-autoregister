module ModelModalities
  def names
    "#{Faker::Food.fruits}#{Faker::Color.color_name}#{Faker::Alphanumeric.alpha(5)}"
  end

  def descriptions
    "#{Faker::Food.fruits}#{Faker::Color.color_name}#{Faker::Alphanumeric.alpha(5)}"
  end

  def segments(id)
    a = {
      "id": 2,
    }

    b = {
      "id": id,
    }

    id == "default" ? a : b
  end

  def operations(id, fee_amount)
    a = {
      "id": 1,
      "fee_amount": 7.20,
    }

    b = {
      "id": id,
      "fee_amount": fee_amount,
    }

    id == "default" || fee_amount == "default" ? a : b
  end

  def card_configurations(plasticId, imageId)
    a = {
      "plastic": {
        "id": 1,
      },
      "image": {
        "id": 1,
      },
    }

    b = {
      "plastic": {
        "id": plasticId,
      },
      "image": {
        "id": imageId,
      },
    }

    plasticId == "default" || imageId == "default" ? a : b
  end

  def product(productId, commercial_originId)
    a = {
      "id": 1,
      "commercial_origin": {
        "id": 1,
      },
    }

    b = {
      "id": productId,
      "commercial_origin": {
        "id": commercial_originId,
      },
    }

    productId == "default" || commercial_originId == "default" ? a : b
  end

  def processor(id)
    a = {
      "id": 1,
    }

    b = {
      "id": id,
    }

    id == "default" ? a : b
  end

  def auto_register(auto_register_configurationId, auto_register_minimun_recharge, fee)
    a = { "auto_register": {
      "configuration": {
        "id": 5,
      },
      "minimun_recharge": 10.11,
      "fee": 2.78,
    } }

    b = { "auto_register": {
      "configuration": {
        "id": auto_register_configurationId,
      },
      "minimun_recharge": auto_register_minimun_recharge,
      "fee": fee,
    } }

    auto_register_configurationId == "default" || auto_register_minimun_recharge == "default" || fee == "default" ? a : b
  end

  def inactivity(inactivity_configurationId, inactivity_fee, inactivity_cicle)
    a = { "inactivity": {
      "configuration": {
        "id": 16,
      },
      "fee": 20.22,
      "cicle": 30,
    } }

    b = { "inactivity": {
      "configuration": {
        "id": inactivity_configurationId,
      },
      "fee": inactivity_fee,
      "cicle": inactivity_cicle,
    } }

    inactivity_configurationId == "default" || inactivity_fee == "default" || inactivity_cicle == "default" ? a : b
  end

  def monthly_fee(monthly_fee_configurationId, monthly_fee_fee)
    a = { "monthly_fee": {
      "configuration": {
        "id": 14,
      },
      "fee": 15.33,
    } }

    b = { "monthly_fee": {
      "configuration": {
        "id": monthly_fee_configurationId,
      },
      "fee": monthly_fee_fee,
    } }

    monthly_fee_configurationId == "default" || monthly_fee_fee == "default" ? a : b
  end

  def p2p(p2p_configurationId, p2p_fee)
    a = { "p2p": {
      "configuration": {
        "id": 6,
      },
      "fee": 14.44,
    } }

    b = { "p2p": {
      "configuration": {
        "id": p2p_configurationId,
      },
      "fee": p2p_fee,
    } }

    p2p_configurationId == "default" || p2p_fee == "default" ? a : b
  end

  def withdraw(withdraw_configurationId, withdraw_fee)
    a = { "withdraw": {
      "configuration": {
        "id": 7,
      },
      "fee": 2.55,
    } }

    b = { "withdraw": {
      "configuration": {
        "id": withdraw_configurationId,
      },
      "fee": withdraw_fee,
    } }

    withdraw_configurationId == "default" || withdraw_fee == "default" ? a : b
  end

  def game_service_recharge(game_service_recharge_configurationId, game_service_recharge_fee)
    a = { "game_service_recharge": {
      "configuration": {
        "id": 12,
      },
      "fee": 6.66,
    } }

    b = { "game_service_recharge": {
      "configuration": {
        "id": game_service_recharge_configurationId,
      },
      "fee": game_service_recharge_fee,
    } }

    game_service_recharge_configurationId == "default" || game_service_recharge_fee == "default" ? a : b
  end

  def card_recharge(card_recharge_configurationId, card_recharge_fee)
    a = { "card_recharge": {
      "configuration": {
        "id": 4,
      },
      "fee": 3.77,
    } }

    b = { "card_recharge": {
      "configuration": {
        "id": card_recharge_configurationId,
      },
      "fee": card_recharge_fee,
    } }

    card_recharge_configurationId == "default" || card_recharge_fee == "default" ? a : b
  end

  def phone_recharge(phone_recharge_configurationId, phone_recharge_fee)
    a = { "phone_recharge": {
      "configuration": {
        "id": 11,
      },
      "fee": 9.88,
    } }

    b = { "phone_recharge": {
      "configuration": {
        "id": phone_recharge_configurationId,
      },
      "fee": phone_recharge_fee,
    } }

    phone_recharge_configurationId == "default" || phone_recharge_fee == "default" ? a : b
  end

  def ted(ted_configurationId, ted_fee)
    a = { "ted": {
      "configuration": {
        "id": 2,
      },
      "fee": 18.99,
    } }

    b = { "ted": {
      "configuration": {
        "id": ted_configurationId,
      },
      "fee": ted_fee,
    } }

    ted_configurationId == "default" || ted_fee == "default" ? a : b
  end

  def payment(payment_configurationId, payment_fee)
    a = { "payment": {
      "configuration": {
        "id": 1,
      },
      "fee": 1.11,
    } }

    b = { "payment": {
      "configuration": {
        "id": payment_configurationId,
      },
      "fee": payment_fee,
    } }

    payment_configurationId == "default" || payment_fee == "default" ? a : b
  end

  def online_ted(online_ted_configurationId)
    b = { "online_ted": {
      "configuration": {
        "id": 15,
      },
      "fee": 2.22,
    } }

    b = { "online_ted": {
      "configuration": {
        "id": online_ted_configurationId,
      },
      "fee": online_ted_fee,
    } }

    online_ted_configurationId == "default" || online_ted_fee == "default" ? a : b
  end
end
