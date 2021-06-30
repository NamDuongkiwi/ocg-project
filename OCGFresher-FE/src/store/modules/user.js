import api from "@/services/user";

const state = () => ({
  user: {},
  isLoginSuccess: false,
  loginMessage: "",
  isRegisterSuccess: false,
  registerMessage: "",
});

const getters = {};

const actions = {
  async login({ commit }, { email, password }) {
    try {
      const response = await api.login({ email, password });
      const id=response.id
      const user=response.payload.user
      console.log(user)
      localStorage.setItem("id", id)
      commit("setUser", user);
      commit("setLoginSuccess", true);
      commit("setLoginMessage", "");
      
    } catch (error) {
      commit("setLoginSuccess", false);

      const errorResponse = error.response;
      if (errorResponse && errorResponse.status === 400) {
        commit(
          "setLoginMessage",
          errorResponse.data?.message || "Login failed!"
        );
      } else {
        commit("setLoginMessage", "Login failed!");
      }
    }
  },
};

const mutations = {
    setUser(state, user) {
      state.user = user;
    },
  
    setLoginSuccess(state, status) {
      state.isLoginSuccess = status;
    },
  
    setLoginMessage(state, message) {
      state.loginMessage = message;
    },
  
    setRegisterSuccess(state, status) {
      state.isRegisterSuccess = status;
    },
  
    setRegisterMessage(state, message) {
      state.registerMessage = message;
    },
  
    logout(state) {
      state.user = {};
      state.isLoginSuccess = false;
      state.isRegisterSuccess = false;
    },
};



export default {
    namespaced: true,
    state,
    getters,
    actions,
    mutations,
  };