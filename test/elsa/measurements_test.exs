defmodule Elsa.MeasurementsTest do
  use Elsa.DataCase

  alias Elsa.Measurements

  describe "measurements" do
    alias Elsa.Measurements.Measurement

    @valid_attrs %{temperature: 120.5}
    @update_attrs %{temperature: 456.7}
    @invalid_attrs %{temperature: nil}

    def measurement_fixture(attrs \\ %{}) do
      {:ok, measurement} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Measurements.create_measurement()

      measurement
    end

    test "list_measurements/0 returns all measurements" do
      measurement = measurement_fixture()
      assert Measurements.list_measurements() == [measurement]
    end

    test "get_measurement!/1 returns the measurement with given id" do
      measurement = measurement_fixture()
      assert Measurements.get_measurement!(measurement.id) == measurement
    end

    test "create_measurement/1 with valid data creates a measurement" do
      assert {:ok, %Measurement{} = measurement} = Measurements.create_measurement(@valid_attrs)
      assert measurement.temperature == 120.5
    end

    test "create_measurement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Measurements.create_measurement(@invalid_attrs)
    end

    test "update_measurement/2 with valid data updates the measurement" do
      measurement = measurement_fixture()
      assert {:ok, %Measurement{} = measurement} = Measurements.update_measurement(measurement, @update_attrs)
      assert measurement.temperature == 456.7
    end

    test "update_measurement/2 with invalid data returns error changeset" do
      measurement = measurement_fixture()
      assert {:error, %Ecto.Changeset{}} = Measurements.update_measurement(measurement, @invalid_attrs)
      assert measurement == Measurements.get_measurement!(measurement.id)
    end

    test "delete_measurement/1 deletes the measurement" do
      measurement = measurement_fixture()
      assert {:ok, %Measurement{}} = Measurements.delete_measurement(measurement)
      assert_raise Ecto.NoResultsError, fn -> Measurements.get_measurement!(measurement.id) end
    end

    test "change_measurement/1 returns a measurement changeset" do
      measurement = measurement_fixture()
      assert %Ecto.Changeset{} = Measurements.change_measurement(measurement)
    end
  end
end
