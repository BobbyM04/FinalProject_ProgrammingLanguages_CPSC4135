# EchoesLang_dsl.rb
module EchoesLang
    # CsvRow represents a row in a CSV file & uses metaprogramming to define accessor methods based on header names
    class CsvRow
        attr_accessor :data, :headers

        def initialize(headers, data)
            @headers = headers
            @data = data
            # Dynamically create accessor methods for each header
            headers.each_with_index do |header, index|
                # Normalize header name
                method_name = header.strip.gsub(/\s+/, "_").downcase
                define_singleton_method(method_name) do
                    data[index]
                end
            end
        end

        def to_a
            data
        end
        
        def to_s
            data.join(',')
        end
    end

    class CsvFile
        include Enumerable 
        attr_accessor :file_path, :rows, :headers, :delimiter

        def initialize(file_path, delimiter = ',')
            @file_path = file_path
            @delimiter = delimiter
            @rows = []
            load_file if File.exist?(file_path)
        end
        # Load CSV content from disk
        def load_file
            File.open(file_path, "r") do |file|
                lines = file.readlines.map(&:chomp)
                if !lines.empty?
                    @headers = lines.shift.split(delimiter)
                    lines.each do |line|
                        row_data = line.split(delimiter)
                        @rows << CsvRow.new(headers, row_data)
                    end
                end
            end
        end
        # Write the current CSV content to disk
        def write_file
            File.open(file_path, "w") do |file|
                file.puts headers.join(delimiter) if headers
                rows.each do |row|
                    file.puts row.to_a.join(delimiter)
                end
            end
        end
        # Override the built-in each to iterate over CsvRow objects
        def each(&block)
            rows.each(&block)
        end
        # Add a row (as an array or CsvRow object) and immediately rewrite the CSV file
        def add_row(row_data)
            new_row = if row_data.is_a?(Array)
                        # If headers are not set, treat the first added row as header
                        if headers.nil?
                            @headers = row_data
                            CsvRow.new(headers, row_data)
                        else
                            CsvRow.new(headers, row_data)
                        end
                      elsif row_data.is_a?(CsvRow)
                        row_data
                      else
                        raise "Invalid row data. Must be an Array or CsvRow object."
                      end
            rows << new_row
            write_file
        end
        # Remove a row by its index and immediately rewrite the CSV file
        def remove_row(index)
            if index < 0 || index >= rows.size
                raise "Index out of bounds."
            end
            rows.delete_at(index)
            write_file
        end
        # Additional DSL feature: Filter rows using a given block
        def filter(&block)
            rows.select(&block)
        end
    end
    # DSL entry point: Allows users to work with the CSV DSL using a code block
    def self.csv(file_path, delimiter = ',', &block)
        csv_file = CsvFile.new(file_path, delimiter)
        block.call(csv_file) if block_given?
        csv_file.write_file
        csv_file
    end
end
# Open class: Extend Ruby's Array to add a simple CSV conversion method
class Array
    def to_csv(delimiter = ',')
        self.join(delimiter)
    end
end