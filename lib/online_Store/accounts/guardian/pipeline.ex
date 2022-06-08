defmodule Online_Store.Accounts.Guardian.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :online_Store,
    error_handler: Online_Store.Accounts.Guardian.ErrorHandler,
    module: Online_Store.Accounts.Services.Guardian

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  # Load the user if either of the verifications worked
  plug Guardian.Plug.LoadResource, allow_blank: true
end
