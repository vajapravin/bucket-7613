require 'csv'

class Dictionary
  @words = nil
  def initialize
    csv_file_path = 'csv/dictionary.csv'
    @words = CSV.foreach(csv_file_path).map(&:first)
  end

  def list
    @words
  end
end