require 'rails_helper'

RSpec.describe 'routes for rounds' do
  it 'routes GET /rounds to the rounds#index action' do
    expect(get('/rounds')).to route_to('rounds#index')
  end

  it 'routes GET /rounds/:id to the rounds#show action' do
    expect(get('/rounds/1')).to route_to(
      controller: 'rounds',
      action: 'show',
      id: '1'
    )
  end

  it 'routes POST /rounds to the rounds#create action' do
    expect(post('/rounds')).to route_to('rounds#create')
  end

  it 'routes PATCH /rounds/:id to the rounds#update action' do
    expect(patch('/rounds/1')).to route_to(
      controller: 'rounds',
      action: 'update',
      id: '1'
    )
  end

  it 'routes DELETE /rounds/:id to the rounds#destroy action' do
    expect(delete('/rounds/1')).to route_to(
      controller: 'rounds',
      action: 'destroy',
      id: '1'
    )
  end
end
