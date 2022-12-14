defmodule Pets.Companions do
  @moduledoc """
  The Companion context.
  """

  import Ecto.Query, warn: false
  alias Pets.Repo

  alias Pets.Companions.Pet
  alias Pets.Accounts.User

  @doc """
  Returns the list of pets.

  ## Examples

      iex> list_pets()
      [%Pet{}, ...]

  """
  def list_pets do
    Repo.all(Pet)
  end

  @doc """
  Gets a single pet.

  Raises `Ecto.NoResultsError` if the Pet does not exist.

  ## Examples

      iex> get_pet!(123)
      %Pet{}

      iex> get_pet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pet!(id), do: Repo.get!(Pet, id)

  @doc """
  Creates a pet.

  ## Examples

      iex> create_pet(%{field: value})
      {:ok, %Pet{}}

      iex> create_pet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pet(struct \\ %User{}, attrs \\ %{}) do
    struct
    |> Pet.assoc
    |> Pet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pet.

  ## Examples

      iex> update_pet(pet, %{field: new_value})
      {:ok, %Pet{}}

      iex> update_pet(pet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pet(%Pet{} = pet, attrs) do
    pet
    |> Pet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pet.

  ## Examples

      iex> delete_pet(pet)
      {:ok, %Pet{}}

      iex> delete_pet(pet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pet(%Pet{} = pet) do
    Repo.delete(pet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pet changes.

  ## Examples

      iex> change_pet(pet)
      %Ecto.Changeset{data: %Pet{}}

  """
  def change_pet(%Pet{} = pet, attrs \\ %{}) do
    Pet.changeset(pet, attrs)
  end

  alias Pets.Companions.Vaccine

  @doc """
  Returns the list of vaccines.

  ## Examples

      iex> list_vaccines()
      [%Vaccine{}, ...]

  """
  def list_vaccines do
    Repo.all(Vaccine)
  end

  @doc """
  Gets a single vaccine.

  Raises `Ecto.NoResultsError` if the Vaccine does not exist.

  ## Examples

      iex> get_vaccine!(123)
      %Vaccine{}

      iex> get_vaccine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vaccine!(id), do: Repo.get!(Vaccine, id) |> Repo.preload(:vaccination_dates)

  @doc """
  Creates a vaccine.

  ## Examples

      iex> create_vaccine(%{field: value})
      {:ok, %Vaccine{}}

      iex> create_vaccine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vaccine(attrs \\ %{}) do
    %Vaccine{}
    |> Vaccine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vaccine.

  ## Examples

      iex> update_vaccine(vaccine, %{field: new_value})
      {:ok, %Vaccine{}}

      iex> update_vaccine(vaccine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vaccine(%Vaccine{} = vaccine, attrs) do
    vaccine
    |> Vaccine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vaccine.

  ## Examples

      iex> delete_vaccine(vaccine)
      {:ok, %Vaccine{}}

      iex> delete_vaccine(vaccine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vaccine(%Vaccine{} = vaccine) do
    Repo.delete(vaccine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vaccine changes.

  ## Examples

      iex> change_vaccine(vaccine)
      %Ecto.Changeset{data: %Vaccine{}}

  """
  def change_vaccine(%Vaccine{} = vaccine, attrs \\ %{}) do
    Vaccine.changeset(vaccine, attrs)
  end

  alias Pets.Companions.Medication

  @doc """
  Returns the list of medications.

  ## Examples

      iex> list_medications()
      [%Medication{}, ...]

  """
  def list_medications do
    Repo.all(Medication)
  end

  @doc """
  Gets a single medication.

  Raises `Ecto.NoResultsError` if the Medication does not exist.

  ## Examples

      iex> get_medication!(123)
      %Medication{}

      iex> get_medication!(456)
      ** (Ecto.NoResultsError)

  """
  def get_medication!(id), do: Repo.get!(Medication, id)

  @doc """
  Creates a medication.

  ## Examples

      iex> create_medication(%{field: value})
      {:ok, %Medication{}}

      iex> create_medication(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_medication(attrs \\ %{}) do
    %Medication{}
    |> Medication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a medication.

  ## Examples

      iex> update_medication(medication, %{field: new_value})
      {:ok, %Medication{}}

      iex> update_medication(medication, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_medication(%Medication{} = medication, attrs) do
    medication
    |> Medication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a medication.

  ## Examples

      iex> delete_medication(medication)
      {:ok, %Medication{}}

      iex> delete_medication(medication)
      {:error, %Ecto.Changeset{}}

  """
  def delete_medication(%Medication{} = medication) do
    Repo.delete(medication)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking medication changes.

  ## Examples

      iex> change_medication(medication)
      %Ecto.Changeset{data: %Medication{}}

  """
  def change_medication(%Medication{} = medication, attrs \\ %{}) do
    Medication.changeset(medication, attrs)
  end

  alias Pets.Companions.VaccinationDate

  @doc """
  Returns the list of vaccination_dates.

  ## Examples

      iex> list_vaccination_dates()
      [%VaccinationDate{}, ...]

  """
  def list_vaccination_dates do
    Repo.all(VaccinationDate)
  end

  @doc """
  Gets a single vaccination_date.

  Raises `Ecto.NoResultsError` if the Vaccination date does not exist.

  ## Examples

      iex> get_vaccination_date!(123)
      %VaccinationDate{}

      iex> get_vaccination_date!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vaccination_date!(id), do: Repo.get!(VaccinationDate, id)

  @doc """
  Creates a vaccination_date.

  ## Examples

      iex> create_vaccination_date(%{field: value})
      {:ok, %VaccinationDate{}}

      iex> create_vaccination_date(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vaccination_date(attrs \\ %{}) do
    %VaccinationDate{}
    |> VaccinationDate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vaccination_date.

  ## Examples

      iex> update_vaccination_date(vaccination_date, %{field: new_value})
      {:ok, %VaccinationDate{}}

      iex> update_vaccination_date(vaccination_date, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vaccination_date(%VaccinationDate{} = vaccination_date, attrs) do
    vaccination_date
    |> VaccinationDate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vaccination_date.

  ## Examples

      iex> delete_vaccination_date(vaccination_date)
      {:ok, %VaccinationDate{}}

      iex> delete_vaccination_date(vaccination_date)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vaccination_date(%VaccinationDate{} = vaccination_date) do
    Repo.delete(vaccination_date)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vaccination_date changes.

  ## Examples

      iex> change_vaccination_date(vaccination_date)
      %Ecto.Changeset{data: %VaccinationDate{}}

  """
  def change_vaccination_date(%VaccinationDate{} = vaccination_date, attrs \\ %{}) do
    VaccinationDate.changeset(vaccination_date, attrs)
  end
end
