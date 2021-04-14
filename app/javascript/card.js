const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY)
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("address[number]"),
      cvc: formData.get("address[cvc]"),
      exp_month: formData.get("address[exp_month]"),
      exp_year: `20${formData.get("address[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      console.log(status)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const token0jb = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", token0jb);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);