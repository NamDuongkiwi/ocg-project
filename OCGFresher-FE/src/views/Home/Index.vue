<template>
  <div>
    <!-- Slide1 -->
    <section class="slide1">
      <div class="wrap-slick1">
        <Carousel :wrapAround="true">
          <Slide v-for="slide in slides" :key="slide.id">
            <div
              class="item-slick1"
              :style="{
                backgroundImage: 'url(' + slide.image + ')',
                width: '100%',
              }"
            >
              <div
                class="
                  wrap-content-slide1
                  sizefull
                  flex-col-c-m
                  p-l-15 p-r-15 p-t-150 p-b-170
                "
              >
                <span class="caption1-slide1 m-text1 t-center animated m-b-15">
                  By Gamers, For Gamers
                </span>

                <h2 class="caption2-slide1 xl-text1 t-center animated m-b-37">
                  Kiwi Shop: Gaming & PC
                </h2>

                <div class="wrap-btn-slide1 w-size1 animated">
                  <router-link
                    to="/products"
                    class="
                      flex-c-m
                      size2
                      bo-rad-23
                      s-text2
                      bgwhite
                      hov1
                      trans-0-4
                    "
                  >
                    Mua Ngay
                  </router-link>
                </div>
              </div>
            </div>
          </Slide>
        </Carousel>
      </div>
    </section>

    <!-- Banner -->
    <SectionBanner />

    <!-- Featured Products -->
    <section class="newproduct bgwhite p-t-45 p-b-105">
      <div class="container">
        <div class="sec-title p-b-60">
          <h3 class="m-text5 t-center">Featured Products</h3>
        </div>

        <ProductsCarousel :products="products" />
      </div>
    </section>

    <!-- Instagram -->

    <!-- Shipping -->
    <SectionShipping />
  </div>
</template>

<script>
import "vue3-carousel/dist/carousel.css";
import { Carousel, Slide } from "vue3-carousel";
import { mapState } from "vuex";
import ProductsCarousel from "@/components/ProductsCarousel.vue";
import SectionBanner from "./SectionBanner.vue";
//import SectionInstagram from "./SectionInstagram.vue";
import SectionShipping from "./SectionShipping.vue";

export default {
  name: "Home",

  components: {
    Carousel,
    Slide,
    ProductsCarousel,
    SectionBanner,
//    SectionInstagram,
    SectionShipping,
  },

  data() {
    return {
      slides: [
        { id: 1, image: require("@/assets/banner02.jpg") },
        { id: 2, image: require("@/assets/banner.jpg") },
        { id: 3, image: require("@/assets/banner03.png") },
      ],
    };
  },

  computed: mapState("products", ["products", "isLoading"]),

  created() {
    this.$store.dispatch("products/getFeaturedProducts");
  },
};
</script>