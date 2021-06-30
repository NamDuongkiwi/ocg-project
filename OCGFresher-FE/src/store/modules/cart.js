import api from "@/services/cart";

const state = () => ({
  items: [],
  isLoading: false,
  addToCartResult: "",
  totalItems: 0,
  isShowCartDropdown: false,
});

const getters = {
  totalItems(state) {
    return state.items.reduce(
      (total, item) => total + item.quantity,
      0
    );
  },

  subTotal(state) {
    return state.items.reduce(
      (totalPrice, item) => totalPrice + item.quantity * item.price,
      0
    );
  },
};

const actions = {
  async addProductToCart({ state, commit }, id) {
    const isExists = state.items.find((p) => p.id === id);

    if (isExists) {
      commit("setAddToCartResult", "Sản phẩm đã tồn tại trong giỏ hàng!");
    } else {
      const newProduct = await api.addProductToCart(id);

      if (newProduct) {
        const items = await api.getAllItems();
        commit("setAddToCartResult", "Đã đưa sản phẩm vào giỏ hàng <3");
        commit("setProducts", items);
      }
    }

    commit("setShowCartDropdown", true);
  },

  async getProductsInCart({ commit }) {
    commit("setLoading", true);

    const items = await api.getAllItems();

    commit("setProducts", items);
    commit("setLoading", false);
  },

  async deleteItem({commit}, id){
    const mess = await api.deleteItem(id)
    if(mess){
      const items = await api.getAllItems();
      commit("setProducts", items);
    }
  }
};



const mutations = {
  setShowCartDropdown(state, status) {
    state.isShowCartDropdown = status;
  },

  setLoading(state, status) {
    state.isLoading = status;
  },

  setProducts(state, items) {
    if (items){
      state.items = items.map((item) => {
        item.totalPrice = item.quantity * item.price;
        return item;
      });
    }else{
      items = []
    }  
    console.log(items.length)
  },

  updateProductQuantity(state, { ItemId, value }) {
    const item = state.items.find((p) => p.id === ItemId);

    value = Number(value);

    if (value > 1) {
      item.quantity = value;
    } else {
      item.quantity = 1;
    }

    item.totalPrice = item.price * item.quantity;
  },

  addProductToCart(state, item) {
    state.items.push(item);
  },

  setAddToCartResult(state, message) {
    state.addToCartResult = message;
  },
};

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations,
};