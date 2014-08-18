configure 'sample' do
  output "samples/dummy.log"
  rate 500
  delimiter "\t"
  labeled true
  field :id,      type: :integer,   countup: true, format: "%04d"
  field :time,    type: :datetime,  format: "[%Y-%m-%d %H:%M:%S]", random: false
  field :level,   type: :string,    any: %w[DEBUG INFO WARN ERROR]
  field :method,  type: :string,    any: %w[GET POST PUT]
  field :uri,     type: :string,    any: %w[/api/v1/people /api/v1/textdata]
  field :reqtime, type: :float,     range: 0.1..5.0
  field :foobar,  type: :string,    length: 8
end
