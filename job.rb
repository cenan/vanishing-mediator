class Job
  attr_reader :job_name

  def initialize(job_name)
    @job_name = job_name
    @filter_blocks = []
  end

  def run(&block)
    instance_eval(&block)
    puts "Running job: #{job_name} at #{@schedule_time}"
  end

  def schedule time
    @schedule_time = time
  end

  def get_json address
  end

  def get_http address
  end

  def filter &block
    @filter_blocks << block
  end

  def check
  end

  def alert
  end

  def self.go
    Dir[File.dirname(__FILE__) + '/jobs/*_job.rb'].each {|file| require file }
  end
end

def job(job_name, &block)
  Job.new(job_name).run(&block)
end
