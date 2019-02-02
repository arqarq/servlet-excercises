package pl.sdacademy;

import java.util.concurrent.atomic.AtomicInteger;

public enum Counter {
    INSTANCE;

    private AtomicInteger count = new AtomicInteger(0);

    public Integer getCount() {
        return count.incrementAndGet();
    }
}
