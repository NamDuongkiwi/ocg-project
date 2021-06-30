<template>
  <div>
    <!-- Title Page -->
    <section>
      <h2 class="l-text2 t-center">Cart</h2>
    </section>

    <!-- Cart -->
    <section class="cart bgwhite p-t-70 p-b-100">
      <div class="container">
        <!-- Cart item -->
        <div class="container-table-cart pos-relative">
          <div class="wrap-table-shopping-cart bgwhite">
            <table class="table-shopping-cart">
              <tr class="table-head">
                <th class="column-1"></th>
                <th class="column-2">Product</th>
                <th class="column-3">Price</th>
                <th class="column-4 p-l-70">Quantity</th>
                <th class="column-5">Total</th>
              </tr>

              <tr
                class="table-row"
                v-for="item in items"
                :key="item.id"
              >
                <td class="column-1">
                  <div class="cart-img-product b-rad-4 o-f-hidden">
                    <img :src="item.Images[0]" alt="IMG-PRODUCT" />
                  </div>
                </td>
                <td class="column-2">{{ item.name }}</td>
                <td class="column-3">{{ currency(item.price) }}</td>
                <td class="column-4">
                  <div class="flex-w bo5 of-hidden w-size17">
                    <button
                      class="
                        btn-num-product-down
                        color1
                        flex-c-m
                        size7
                        bg8
                        eff2
                      "
                      @click="
                        updateProductQuantity({
                          ItemId: item.id,
                          value: item.quantity - 1,
                        })
                      "
                    >
                      <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                    </button>

                    <input
                      class="size8 m-text18 t-center num-product"
                      type="number"
                      name="num-product1"
                      :value="item.quantity"
                      @input="
                        updateProductQuantity({
                          ItemId: item.id,
                          value: $event.target.value,
                        })
                      "
                    />

                    <button
                      class="btn-num-product-up color1 flex-c-m size7 bg8 eff2"
                      @click="
                        updateProductQuantity({
                          ItemId: item.id,
                          value: item.quantity + 1,
                        })
                      "
                    >
                      <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                    </button>
                  </div>
                </td>
                <td class="column-5">{{ currency(item.totalPrice) }}</td>
                 <td class="column-5"><button class="btn" @click="deleteItem($event, item.id)"><strong>X</strong></button></td>
              </tr>

              <tr class="table-row">
                <td class="column-1" colspan="3">
                  <div class="flex-w flex-m w-full-sm">
                    <div class="size11 bo4 m-r-10">
                      <input
                        class="sizefull s-text7 p-l-22 p-r-22"
                        type="text"
                        name="coupon-code"
                        placeholder="Coupon Code"
                      />
                    </div>

                    <div class="size12 trans-0-4 m-t-10 m-b-10 m-r-10">
                      <!-- Button -->
                      <button
                        class="sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4"
                      >
                        Apply coupon
                      </button>
                    </div>
                  </div>
                </td>

                <td class="text-right p-r-10"><b>Subtotal:</b></td>

                <td class="column-5">{{ currency(subTotal) }}</td>
              </tr>
            </table>
          </div>
        </div>

        <!-- Total -->
        <CartTotals :subTotal="subTotal" />
      </div>
    </section>
  </div>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";
import { currency } from "@/utils/currency";
import CartTotals from "./CartTotals.vue";
export default {
  name: "Cart",
  components: {
    CartTotals,
  },
  computed: {
    ...mapState("cart", ["items", "isLoading"]),
    ...mapGetters("cart", ["subTotal"]),
  },
  methods: {
    currency,
    ...mapMutations("cart", ["updateProductQuantity", "setProducts"]),
    deleteItem(event, id){
      event.preventDefault();
      this.$store.dispatch("cart/deleteItem",id)
    }
  },
};
</script>