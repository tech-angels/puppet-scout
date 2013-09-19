# Manages scoutapp.com agent
class scout($scout_key=false) {
  package {
    ['scout', 'elif', 'request-log-analyzer']:
      ensure   => 'installed',
      provider => 'gem';
  }

  # set up the cronjob that runs the agent every minute
  if $scout_key {
    cron {
      'scout':
        command => "/usr/local/bin/scout ${scout_key}",
        user	=> 'scout';
    }
  }
}
