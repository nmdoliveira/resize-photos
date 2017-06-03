module JSONMethods
  def read_json(name)
    File.read(Rails.root.join("spec/support/files/#{name}.json"))
      .gsub(/\s|\n/, "")
  end
end
