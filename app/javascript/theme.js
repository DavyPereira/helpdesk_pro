document.addEventListener("turbo:load", () => {
  const button = document.getElementById("theme-toggle")

  if (!button) return

  const savedTheme = localStorage.getItem("theme")

  if (savedTheme === "dark") {
    document.documentElement.classList.add("dark")
  }

  button.addEventListener("click", () => {
    document.documentElement.classList.toggle("dark")

    if (document.documentElement.classList.contains("dark")) {
      localStorage.setItem("theme", "dark")
    } else {
      localStorage.setItem("theme", "light")
    }
  })
})