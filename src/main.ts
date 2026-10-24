
const message = document.querySelector<HTMLParagraphElement>("#message");
const buttons = document.querySelectorAll<HTMLButtonElement>(".add-to-cart");

buttons.forEach((button: HTMLButtonElement) => {
  button.addEventListener("click", () => {
    const product = button.dataset.product;

    if (message && product) {
      message.textContent =
        `${product} selected! Contact us to place your order.`;
    }
  });
});
