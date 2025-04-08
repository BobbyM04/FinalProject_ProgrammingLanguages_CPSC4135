# test_csv_dsl.rb
require_relative 'EchoesLang_dsl'

puts "Enter CSV file name: "
file_name = gets.chomp

# Start the DSL with a block that lets you interactively add and remove rows
EchoesLang.csv(file_name) do |csv|
    # If the CSV is empty, prompt the user to set headers
    if csv.headers.nil?
        puts "CSV file you entered is empty. Enter the header names you wish to use (separated by commas): "
        header_input = gets.chomp
        headers = header_input.split(',').map(&:strip)
        csv.add_row(headers)
    end

    loop do
        puts "\nWhat would you like to do?: "
        puts "1: Add a row"
        puts "2: Remove a Row"
        puts "3: Display all rows"
        puts "4: Exit"

        choice = gets.chomp.to_i

        case choice
        when 1
            # Prompt user for row data
            puts "Enter row data (separated by commas): "
            row_input = gets.chomp
            row_data = row_input.split(',').map(&:strip)
            csv.add_row(row_data)
            puts "Row added!"
        when 2
            # Prompt user for which row index to remove
            puts "Enter the index (starting from 0) of the row to remove: "
            index = gets.chomp.to_i
            
            begin
                csv.remove_row(index)
                puts "Row removed!"
            rescue => e
                puts "Error: #{e.message}"
            end
        when 3
            # Display all rows
            puts "Current CSV Rows: "
            csv.each_with_index do |row, i|
                puts "#{i}: Name: #{row.name}, Age: #{row.age}, City: #{row.city}"
            end
        when 4
            puts "Exiting..."
            break
        else
            puts "Invalid choice! Try again."
        end
    end
end