defmodule RealtimeWeb do
  @moduledoc """
  A lightweight Phoenix application, wrapping the logic contained in
  `Realtime`.

  This module is the entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use RealtimeWeb, :controller
      use RealtimeWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: RealtimeWeb
      import Plug.Conn

      alias RealtimeWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/realtime_web/templates",
        namespace: RealtimeWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import RealtimeWeb.ErrorHelpers

      alias RealtimeWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      # import Phoenix.Channel,
      #   except: [
      #     broadcast: 3,
      #     broadcast!: 3,
      #     broadcast_from: 3,
      #     broadcast_from!: 3
      #   ]

      # import Realtime.PubSub,
      #   only: [
      #     broadcast: 2,
      #     broadcast!: 2,
      #     broadcast_from: 2,
      #     broadcast_from!: 2
      #   ]
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end