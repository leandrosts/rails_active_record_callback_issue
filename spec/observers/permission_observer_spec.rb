require 'spec_helper'

describe PermissionObserver do
  context 'given a permission between an user and a vehicle' do
    before do
      @user = User.create
      @vehicle = Vehicle.create
      @permission = Permission.create :user => @user, :vehicle => @vehicle
      PermissionObserver.called = 0
    end

    context 'when removing the permission directly' do
      before do
        @permission.destroy
      end

      it "should have called the permission's after commit callback" do
        PermissionObserver.called.should == 1
      end
    end

    context "when removing the association from the user using 'update attributes'" do
      before { @user.update_attributes :vehicle_ids => [] }

      it "should have called the permission's after commit callback" do
        PermissionObserver.called.should == 1
      end
    end

    context "when removing the association from the user using 'clear'" do
      before { @user.vehicles.clear }

      it "should have called the permission's after commit callback" do
        PermissionObserver.called.should == 1
      end
    end
  end
end