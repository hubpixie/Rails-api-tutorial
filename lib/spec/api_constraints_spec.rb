require 'spec_helper'
require 'api_constraints'

describe ApiConstraints do
  let(:api_constraints_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraints_v2) { ApiConstraints.new(version: 2, default: true) }
Rails.logger.debug "api_constraints_v1 = #{:api_constraints_v1.inspect}"
Rails.logger.debug "api_constraints_v2 = #{:api_constraints_v2.inspect}"
  describe "matches?" do

    it "returns true when the version matches the 'Accept' header" do
      request = double(host: 'api.railstutorial.dev',
                       headers: {"Accept" => "application/vnd.railstutorial.v1"})
      api_constraints_v1.matches?(request).should be_true
    end

    it "returns the default version when 'default' option is specified" do
      request = double(host: 'api.railstutorial.dev')
      api_constraints_v2.matches?(request).should be_true
    end
  end
end