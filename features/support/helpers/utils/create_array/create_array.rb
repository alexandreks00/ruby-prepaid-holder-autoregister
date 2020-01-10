module CreateArrayObject
  def createArray(*createArray)
    length = createArray.length
    cont = 0
    array = []

    while cont < length
      array.push(createArray[cont])
      cont = cont + 1
    end

    return array
  end

  def createObject(*createObject)
    length = createObject.length
    cont = 0
    hash = {}

    while cont < length
      hash.merge!(createObject[cont])
      cont = cont + 1
    end

    return hash
  end
end
