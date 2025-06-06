# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

config.load_autoconfig()

c.auto_save.session = True
c.content.notifications.enabled = True

# Fonts
c.fonts.default_size = "14pt"

# Tabs
c.tabs.favicons.scale = 1.5
c.tabs.padding = {"top": 10, "bottom": 10, "left": 5, "right": 5}
c.tabs.position = "left"

# Search engines
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
}
