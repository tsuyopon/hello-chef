# Load ChefSpec and put our test into ChefSpec mode.
require 'chefspec'

# Describing our custom resource.
describe 'this is mycookbook_greet test' do

  # debugしたい場合には以下の行を有効にすると良い。
  #chefspec_options[:log_level] = :debug

  # Normally ChefSpec skips running resources, but for this test we want to
  # actually run this one custom resource.
  # see: https://github.com/chefspec/chefspec/tree/v8.0.0#step-into
  step_into :mycookbook_greet

  # Nothing in this test is platform-specific, so use the latest Ubuntu for
  # simulated data.
  platform 'ubuntu'

  # Create an example group for testing the resource defaults.
  context 'with the default greeting' do
    # Set the subject of this example group to a snippet of recipe code calling
    # our custom resource.
    recipe do
      mycookbook_greet 'This is Default test'
    end

    # Confirm that the resources created by our custom resource's action are
    # correct. ChefSpec matchers all take the form `action_type(name)`.
    it { is_expected.to write_log('Hello world') }
  end

  # Create a second example group to test a different block of recipe code.
  context 'with a custom greeting' do
    # This time our test recipe code sets a property on the custom resource.
    recipe do
      mycookbook_greet 'This is Bonjour test' do
        greeting 'Bonjour'
      end
    end

    # Use the same kind of matcher as before to confirm the action worked.
    it { is_expected.to write_log('Bonjour world') }
  end
end
