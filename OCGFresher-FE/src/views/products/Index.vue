<template>
  <div>
    <!-- Title Page -->
    <select>
      <option v-for="cate in cates" :key="cate.id" :value="cate.id"> {{cate.category_name}}</option>
    </select>
    
    <div v-for="cate in cates" :key="cate.id">
      <h2>{{ cate.id }} - {{ cate.category_name }}</h2>
    </div>

    <!-- Content page -->
    <section class="bgwhite p-t-55 p-b-65">
      <div class="container" style="max-width:1600px">
        <div class="row">
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-50">
            <LeftBar @get-cate="getCate"/>
          </div>

          <div class="col-sm-6 col-md-8 col-lg-9 p-b-50">
            <div class="flex-sb-m flex-w p-b-35">
              <div class="flex-w">
              </div>

              <span class="s-text8 p-t-5 p-b-5">
                Showing {{ itemStartIndex }}–{{ itemEndIndex }} of
                {{ totalItems }} results
              </span>
            </div>

            <transition name="fade">
              <!-- <div v-if="isLoading" data-loader="ball-scale"></div> -->

              <div v-if="!isLoading">
                <div class="row">
                  <div
                    class="col-sm-12 col-md-6 col-lg-4 p-b-50"
                    v-for="product in products"
                    :key="product.id"
                  >
                    <!-- Block2 -->
                    <div class="block2">
                      <div
                        class="block2-img wrap-pic-w of-hidden pos-relative"
                        :class="{
                          'block2-labelnew': product.isNew,
                          'block2-labelsale': product.isSale,
                        }"
                      >
                        <img :src="product.images[0]" alt="IMG-PRODUCT" />

                        <div class="block2-overlay trans-0-4">
                          <a
                            href="#"
                            class="block2-btn-addwishlist hov-pointer trans-0-4"
                          >
                            <i
                              class="icon-wishlist icon_heart_alt"
                              aria-hidden="true"
                            ></i>
                            <i
                              class="icon-wishlist icon_heart dis-none"
                              aria-hidden="true"
                            ></i>
                          </a>

                          <div class="block2-btn-addcart w-size1 trans-0-4">
                            <!-- Button -->
                            <button
                              class="
                                flex-c-m
                                size1
                                bg4
                                bo-rad-23
                                hov1
                                s-text1
                                trans-0-4
                              "
                              @click="addProductToCart($event, product.id)"
                            >
                              Add to Cart
                            </button>
                          </div>
                        </div>
                      </div>

                      <div class="block2-txt p-t-20">
                        <router-link
                          :to="'/products/' + product.id"
                          class="block2-name dis-block s-text3 p-b-5"
                        >
                          {{ product.name }}
                        </router-link>

                        <span class="block2-price m-text6 p-r-5">
                          {{ currency(product.price) }}
                        </span>
                      </div>
                    </div>
                  </div>
                </div>

                <Pagination
                  :length="totalItems"
                  :pageSize="limit"
                  :pageIndex="pageIndex"
                  @change="changePage"
                />
              </div>
            </transition>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { mapState, mapGetters, mapActions } from "vuex";
import { currency } from "@/utils/currency";
import Pagination from "@/components/Pagination.vue";
import LeftBar from "./LeftBar.vue";
//import api from "@/services/products"


export default {
  name: "Products",

  data() {
    return{
      cates: [],
    }
  },

  components: {
    Pagination,
    LeftBar,
  },

  

  computed: {
    ...mapState("products", [
      "isLoading",
      "products",
      "totalItems",
      "pageIndex",
      "limit",
    ]),
    ...mapGetters("products", [
      "sortDropdownValue",
      "itemStartIndex",
      "itemEndIndex",
    ]),
  },

  created() {
    this.$store.dispatch("products/getProducts", {});
  },

  methods: {
    currency,

    sortProducts(option) {
      const options = option.value.split("-");
      const sort = options[0],
        order = options[1];

      this.$store.dispatch("products/getProducts", { sort, order });
    },

    changePage(pageIndex) {
      this.$store.dispatch("products/getProducts", { pageIndex });
    },

    ...mapActions("products", ["getProducts"]),
    addProductToCart(event, id){
      event.preventDefault();
      console.log(id)
      this.$store.dispatch("cart/addProductToCart",id)
    }
  },
};
</script>