type ElmPagesInit = {
  load: (elmLoaded: Promise<unknown>) => Promise<void>;
  flags: unknown;
};

const config: ElmPagesInit = {
  load: async function (elmLoaded) {
    const app = await elmLoaded;
    console.log("App loaded", app);

    app.ports.toggleDialog.subscribe(id => {
      const dialog = document.querySelector(`#${id}`)

      if (dialog.open) {
        dialog.close?.();
      } else {
        dialog.showModal?.();
      }
    })
  },
  flags: function () {
    return "You can decode this in Shared.elm using Json.Decode.string!";
  },
};

export default config;
