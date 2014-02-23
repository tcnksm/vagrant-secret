# Vagrant-Secret

You don't want to write your secret variable like `api_key` or `token` directly in your Vagrantfile.

This plugin enables, 

1. Generate `secret.yaml` and write your secret keys
1. Use secret variable in your Vagrantfile

## Installation

Install it as a Vagrant plugin.

```bash
$ vagrant plugin install vagrant-secret
```

## Usage

Generate `secret.yaml`

```bash
$ vagrant secret-init
```

Edit your `.vagrant.secret.yaml`

```
client_id: "*******"
api_key: "********"
```

Use it in your Vagrantfile (for example when you use [DigitalOcean](https://cloud.digitalocean.com/)).

```ruby
Vagrant.configure('2') do |config|  
  config.vm.provider :digital_ocean do |provider, override|
    provider.client_id            = Secret.client_id
    provider.api_key              = Secret.api_key
  end
end
```

You can use your yaml key as `Secret` class variable. 


## Contributing

1. Fork it ( http://github.com/<my-github-username>/vagrant-secret/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
