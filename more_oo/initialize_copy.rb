# Настройка поведения при копировании объекта
class Document
  attr_accessor :title, :text
  attr_reader :timestamp

  def initialize(title, text)
    @title = title
    @text = text
    @timestamp = Time.now
  end

  # Автоматический вызов при clone или dup
  def initialize_copy(other)
    @timestamp = Time.now
  end
end

if $0 == __FILE__
  doc1 = Document.new("some title", "some text")
  doc2 = doc1.clone

  p doc1.timestamp == doc2.timestamp
  p doc1.title == doc2.title
  p doc1.object_id
  p doc2.object_id
end
