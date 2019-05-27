# Question 1
#
# Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

class SecretFile
  # Remove attr_reader because we have to create a new getter method with extra functionality
  # attr_reader :data

  # Pass in a Log file when initializing SecretFile
  def initialize(secret_data, log_file)
    @data = secret_data
    @log_file = log_file
  end

  # This is our new getter method, calling the create_log_entry method of the SecurityLogger collaborator object before we return @data
  def data
    @log_file.create_log_entry
    @data
  end
end

# She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following:

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this practice problem.
